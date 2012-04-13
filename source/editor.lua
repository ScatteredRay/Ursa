project("editor")
    kind("WindowedApp")
    files { "Editor/src/**.h", "Editor/src/**.cpp" }
    includedirs { "Irrlicht/inc", "lua/inc" }
    links { "irrlicht", "lua", "OpenGL.framework", "Cocoa.framework", "IOKit.framework" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }