project("editor")
    kind("WindowedApp")
    files { "Editor/src/**.h", "Editor/src/**.cpp" }
    includedirs { "Irrlicht/inc", "lua/inc", "mongoose/inc" }
    links { "irrlicht", "lua", "mongoose" }

    if(os.get() == "macosx") then
       links { "OpenGL.framework", "Cocoa.framework", "IOKit.framework" }
    elseif(os.get() == "windows") then
       links { "Ws2_32" }
       defines { "_IRR_WINDOWS_" }
    end

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }