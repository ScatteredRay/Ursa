project("luasocket")
    kind("StaticLib")
    files { "luasocket/inc/*.h", "luasocket/src/*.c" }
    -- Only on win32.
    excludes { "luasocket/src/wsocket.c" }
    includedirs { "luasocket/inc", "lua/inc" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }
