project("crowgame")
    kind("WindowedApp")
    files { "CrowGame/**.h", "CrowGame/**.cpp" }
    includedirs { "../include" }
    links { "irrlicht", "OpenGL.framework", "Cocoa.framework", "IOKit.framework" }

    configuration("Debug")
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration("Release")
        flags { "Optimize" }