#include "luamongoose.h"

#include <stdlib.h>
#include <string.h>
#include <lua.h>
#include <lauxlib.h>

#include <pthread.h>

#include "mongoose.h"

typedef pthread_mutex_t simple_mutex;

void simple_mutex_init(simple_mutex* mutex)
{
    pthread_mutex_init(mutex, NULL);
}

void simple_mutex_destroy(simple_mutex* mutex)
{
    pthread_mutex_destroy(mutex);
}

void simple_mutex_lock(simple_mutex* mutex)
{
    pthread_mutex_lock(mutex);
}

void simple_mutex_unlock(simple_mutex* mutex)
{
    pthread_mutex_unlock(mutex);
}

struct lua_mg_data
{
    lua_State* lua;
    simple_mutex mutex;
    struct mg_context* mgctx;
    int server_lua_ref;
};

// Stolen from mongoose.c:
static void gmt_time_string(char *buf, size_t buf_len, time_t *t) {
  strftime(buf, buf_len, "%a, %d %b %Y %H:%M:%S GMT", gmtime(t));
}

void* mongoose_callback(enum mg_event event,
                        struct mg_connection* conn,
                        const struct mg_request_info* request_info)
{
    struct lua_mg_data* luadata = (struct lua_mg_data*)request_info->user_data;

    if(event != MG_NEW_REQUEST)
    {
        return NULL;
    }

    void* retval = NULL;

    simple_mutex_lock(&luadata->mutex);

    lua_rawgeti(luadata->lua, LUA_REGISTRYINDEX, luadata->server_lua_ref);
    lua_getfield(luadata->lua, -1, "onrequest");
    if(lua_isfunction(luadata->lua, -1))
    {
        lua_pushstring(luadata->lua, request_info->request_method);
        lua_pushstring(luadata->lua, request_info->uri);
        lua_call(luadata->lua, 2, 1);
        printf("return\n");
        if(lua_isstring(luadata->lua, -1))
        {
            printf("string\n");
            const char* response = lua_tostring(luadata->lua, -1);
            int response_length = strlen(response);
            printf("response: %s", response);

            time_t curtime = time(NULL);
            char date[64];
            gmt_time_string(date, sizeof(date), &curtime);
            (void) mg_printf(conn,
                             "HTTP/1.1 %d %s\r\n"
                             "Date: %s\r\n"
                             //Cache-Control
                             "Content-Type: %s\r\n"
                             "Content-Length: %d\r\n"
                             "Connection: close\r\n\r\n",
                             200, "OK", date, "application/json", response_length);

            (void) mg_write(conn, response, response_length);
            retval = 1;
        }

        lua_pop(luadata->lua, 1); // function return value

    }
    else
    {
        lua_pop(luadata->lua, 1); // "onrequest" value
    }
    lua_pop(luadata->lua, 1); // table
    //TODO: Implement me! return non-nil
    simple_mutex_unlock(&luadata->mutex);
    return retval;
}

int mongoose_start(lua_State* L)
{
    struct lua_mg_data* luadata = (struct lua_mg_data*)malloc(sizeof(struct lua_mg_data));
    luadata->lua = L;
    simple_mutex_init(&luadata->mutex);
    simple_mutex_lock(&luadata->mutex);

    const char* document_root = ".";

    lua_getglobal(L, MONGOOSE_MODULE_NAME);
    lua_getfield(L, -1, "document_root");
    if(lua_isstring(L, -1))
    {
        document_root = lua_tostring(L, -1);
    }

    const char* options[] = {
        "listening_ports", "8080",
        "enable_directory_listing", "no",
        "document_root", document_root,
        NULL
    };

    luadata->mgctx = mg_start(&mongoose_callback, luadata, options);

    lua_pop(L, 2);

    lua_newtable(L);
    lua_pushlightuserdata(L, luadata);
    lua_setfield(L, -2, MONGOOSE_TABLE_FIELD);

    lua_pushvalue(L, -1);
    int ref = luaL_ref(L, LUA_REGISTRYINDEX);
    luadata->server_lua_ref = ref;

    return 1;
}

int mongoose_end(lua_State* L)
{
    lua_getfield(L, -1, MONGOOSE_TABLE_FIELD);
    struct lua_mg_data* luadata = lua_touserdata(L, -1);
    lua_pop(L, 2);

    simple_mutex_unlock(&luadata->mutex);
    mg_stop(luadata->mgctx);
    simple_mutex_destroy(&luadata->mutex);
    luaL_unref(L, LUA_REGISTRYINDEX, luadata->server_lua_ref);
    free(luadata);
    return 0;
}

int mongoose_update(lua_State* L)
{
    lua_getfield(L, -1, MONGOOSE_TABLE_FIELD);
    struct lua_mg_data* luadata = lua_touserdata(L, -1);
    lua_pop(L, 2);

    simple_mutex_unlock(&luadata->mutex);
    // If the mutex scheduling is decent, it'll should switch here, otherwise put in a wait;
    simple_mutex_lock(&luadata->mutex);
    return 0;
}

static const luaL_Reg mongooselib[] = {
    {"start", mongoose_start},
    {"end", mongoose_end},
    {"update", mongoose_update},
    {NULL, NULL}
};

int lua_open_mongoose(lua_State* L)
{
    luaL_register(L, MONGOOSE_MODULE_NAME, mongooselib);
    return 1;
}
