solution("ursa")
configurations { "Debug", "Release" }
location("../build")
targetdir("../bin")
language("C++")

if(macosx) then
   buildoptions("-std=c++0x -stdlib=libc++ -U__STRICT_ANSI__")
   linkoptions("-stdlib=libc++")
end

require "irrlicht"
require "lua"
require "editor"