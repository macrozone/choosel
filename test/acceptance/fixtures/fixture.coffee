
createRoute = (route, handler) ->
     
    if typeof __meteor_bootstrap__.app != 'undefined'
        connectHandlers = __meteor_bootstrap__.app
    else
        connectHandlers = WebApp.connectHandlers
    
    handle = (req, res) ->
        res.writeHead 200, {'Content-Type': 'text/plain'}
        handler req, res
        res.end(route + ' complete')
     
    connectHandlers.stack.splice 0, 0, 
        route: '/' + route
        handle: handle.future()
        
    


resetApp = ->
	
	Problems.remove {}
	Solutions.remove {}

Meteor.startup -> 
	resetApp()
	createRoute "reset", resetApp

