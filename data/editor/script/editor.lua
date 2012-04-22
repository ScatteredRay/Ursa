--require('socket')
require('xavante.xavante')

xavante.HTTP{
    server = {host = "*", port = 9080},
    
    defaultHost = {
    	rules = simplerules
    },
}
