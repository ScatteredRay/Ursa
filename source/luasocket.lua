project("luasocket")
    kind("StaticLib")
    files { "luasocket/inc/*.h", "luasocket/src/*.c" }
    if(os.get() == "windows") then
       excludes { "luasocket/src/unix.c", "luasocket/src/usocket.c" }
    else
       excludes { "luasocket/src/wsocket.c" }
    end
    includedirs { "luasocket/inc", "lua/inc" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }
