server = httpd.start()

game.onupdate = function()
   httpd.update(server)
end