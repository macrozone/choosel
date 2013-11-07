# Choosel main client code file
this is a litertate-coffe-script file!

indented code is real program code, but everything here is normal markdown
See http://coffeescript.org/#literate


## Handlebar helpers
Handlebars is a template language and meteor's default one, 
see http://handlebarsjs.com/

you can register helper functions
this example here just logs something and can be used like this

{{log problem}}

then, the template-var problem will be logged in the console


	Handlebars.registerHelper 'log', (data) -> console.log data

			
## page routes and init functions
uses mini-pages, see https://github.com/cmather/meteor-mini-pages

### mini-pages setup functions

	initProblem = (page)->
		Session.set 'problemID', page.params._id

### routes

	Meteor.pages
	    '/': to: 'home', as: 'root', nav: 'posts', layout: "homeLayout"
	    '/problem/:_id': to: 'problemPage', before: [initProblem]
	    '*': 'notFound'



## Template functions
as the functions will get more, we will distribute them into individual files

	Template.createProblem.events = 
		"click .save": ->

			title = $(".createProblem .title").val()
			description = $(".createProblem .description").val()
			Problems.insert title: title, description: description

	Template.addSolution.events = 
		"click .save": ->
			title = $(".addSolution .title").val()
			description = $(".addSolution .description").val()
			Solutions.insert problemID: Session.get('problemID'), title: title, description: description

	Template.allProblems.problems = ->
		Problems.find()

	Template.problem.problem = ->
		Problems.findOne _id: Session.get 'problemID'

	Template.solutions.solutions = ->
		console.log Session.get 'problemID'
		Solutions.find problemID: Session.get 'problemID'