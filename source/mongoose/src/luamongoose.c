#include "luamongoose.h"

#include <stdlib.h>
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
};

void* mongoose_callback(enum mg_event event,
                        struct mg_connection* conn,
                        const struct mg_request_info* request_info)
{
    struct lua_mg_data* luadata = (struct lua_mg_data*)request_info->user_data;

    simple_mutex_lock(&luadata->mutex);
    //TODO: Implement me! return non-nil
    simple_mutex_unlock(&luadata->mutex);
    return NULL;
}

int mongoose_start(lua_State* L)
{
    struct lua_mg_data* luadata = (struct lua_mg_data*)malloc(sizeof(struct lua_mg_data));
    luadata->lua = L;
    simple_mutex_init(&luadata->mutex);
    simple_mutex_lock(&luadata->mutex);

    const char* options[] = {
        "listening_ports", "8080",
        NULL
    };

    luadata->mgctx = mg_start(&mongoose_callback, luadata, options);

    //TODO: return luadata
    lua_pushlightuserdata(L, luadata);

    return 1;
}

int mongoose_end(lua_State* L)
{
    struct lua_mg_data* luadata = lua_touserdata(L, -1);
    lua_pop(L, 1);

    simple_mutex_unlock(&luadata->mutex);
    mg_stop(luadata->mgctx);
    simple_mutex_destroy(&luadata->mutex);
    free(luadata);
    return 0;
}

int mongoose_update(lua_State* L)
{
    struct lua_mg_data* luadata = lua_touserdata(L, -1);
    lua_pop(L, 1);

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
    luaL_register(L, "httpd", mongooselib);
    return 1;
}
