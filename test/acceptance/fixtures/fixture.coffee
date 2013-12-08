
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
		
	
createUser = ->
	Accounts.createUser username: "foo", email: "foo@example.com", password: "bar"
	

resetApp = ->
	Problems.remove {}
	Solutions.remove {}
	Ratings.remove {}
	Meteor.users.remove {}
	Criteria.remove {}
	createUser()

Meteor.startup -> 
	resetApp()
	createRoute "reset", resetApp

