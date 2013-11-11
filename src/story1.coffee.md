# Story 1: Entscheidungsproblem erfassen

Als Problemsteller möchte ich ein Entscheidungsproblem mit Metadaten wie Titel und Beschreibung erfassen, um diese Problemstellung mit
anderen zu teilen.

**Schätzung:** 2

**Priorität:** 1



## Client
	
	if Meteor.isClient
	
		initProblem = (page)->
			Session.set 'problemID', page.params._id

		@Router.pages
			'/': to: 'homePage', as: 'root', layout: "homeLayout"
			'/problem/:_id': to: 'problemPage', before: [initProblem]


### Template functions

#### Entscheidungsproblem erfassen

		Template.createProblem.events = 
			"click .save": ->
				title = $(".createProblem .title").val()
				description = $(".createProblem .description").val()
				Problems.insert title: title, description: description

		Template.allProblems.problems = ->
			Problems.find()

		Template.problem.problem = ->
			Problems.findOne _id: Session.get 'problemID'


#### Lösung zu Problem erfassen

		Template.solutions.solutions = ->
			Solutions.find {problemID: Session.get('problemID')}, sort: title: 1

		Template.addSolution.events = 
			"click .save": ->
				
				title = $(".addSolution .title").val()
				description = $(".addSolution .description").val()
				Solutions.insert problemID: Session.get('problemID'), title: title, description: description

		

		