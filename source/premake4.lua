solution("ursa")
configurations { "Debug", "Release" }
location("../build")
targetdir("../bin")
language("C++")

require "irrlicht"
require "lua"
require "crowgame"