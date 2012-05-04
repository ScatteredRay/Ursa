project("luacjson")
    kind("StaticLib")
    files { "luacjson/inc/*.h", "luacjson/src/*.c" }
    includedirs { "lua/inc", "luacjson/inc" }

    defines { "ENABLE_CJSON_GLOBAL" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }
