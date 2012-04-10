project("crowgame")
    kind("WindowedApp")
    files { "CrowGame/src/**.h", "CrowGame/src/**.cpp" }
    includedirs { "Irrlicht/inc" }
    links { "irrlicht", "OpenGL.framework", "Cocoa.framework", "IOKit.framework" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }