server = httpd.start()

server.onrequest = function(method, uri, content)
   if(uri == "/test") then
      return cjson.encode({uri = uri})
   else
      return nil
   end
end

game.onupdate = function()
   httpd.update(server)
end