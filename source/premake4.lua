solution("ursa")
configurations { "Debug", "Release" }
location("../build")
targetdir("../bin")
language("C++")

if(os.get() == "macosx") then
   -- Fuck, why is it so hard to use C++11
   -- This requires the apple llvm compiler, no easy way to set that in premake afaict.
   --buildoptions("-std=c++11 -stdlib=libc++ -U__STRICT_ANSI__")
   --linkoptions("-stdlib=libc++")
end

defines { "LUA_COMPAT_MODULE=1" }

require "irrlicht"
require "lua"
require "editor"
