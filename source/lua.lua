project("lua")
    kind("StaticLib")
    files { "lua/inc/*.h", "lua/src/*.c" }
    includedirs { "lua/inc" }

    defines { "LUA_COMPAT_MODULE=1" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }
