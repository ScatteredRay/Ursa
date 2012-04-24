project("lua")
    kind("StaticLib")
    files { "lua/inc/*.h", "lua/src/*.c" }
    includedirs { "lua/inc" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }
