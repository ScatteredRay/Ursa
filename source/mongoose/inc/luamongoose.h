#ifndef _LUAMONGOOSE_H_
#define _LUAMONGOOSE_H_

#include <lua.h>

#define MONGOOSE_MODULE_NAME "httpd"
#define MONGOOSE_TABLE_FIELD "mongooseptr"

int lua_open_mongoose(lua_State* L);

#endif //_LUAMONGOOSE_H_
