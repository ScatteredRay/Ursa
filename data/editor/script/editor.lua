server = httpd.start()

server.onrequest = function(method, uri)
   if(uri == "/test") then
      return "{\"uri\" : \"" .. uri .. "\"}"
   else
      return nil
   end
end

game.onupdate = function()
   httpd.update(server)
end