project("mongoose")
    kind("StaticLib")
    files { "mongoose/inc/*.h", "mongoose/src/*.c" }
    includedirs { "mongoose/inc", "lua/inc" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }
