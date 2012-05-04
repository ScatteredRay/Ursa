server = httpd.start()

server.onrequest = function()
   print("Request")
end

game.onupdate = function()
   httpd.update(server)
end