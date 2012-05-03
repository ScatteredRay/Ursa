#ifndef _LUAMONGOOSE_H_
#define _LUAMONGOOSE_H_

#include <lua.h>

#define MONGOOSE_MODULE_NAME "httpd"

int lua_open_mongoose(lua_State* L);

#endif //_LUAMONGOOSE_H_
