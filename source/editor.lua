project("editor")
    kind("WindowedApp")
    files { "Editor/src/**.h", "Editor/src/**.cpp" }
    includedirs { "Irrlicht/inc", "lua/inc", "luasocket/inc" }
    links { "irrlicht", "lua", "luasocket" }
    if(os.get() == "macosx") then
       links { "OpenGL.framework", "Cocoa.framework", "IOKit.framework" }
    end

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }