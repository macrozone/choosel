# Story 1: Entscheidungsproblem erfassen

Als Problemsteller möchte ich ein Entscheidungsproblem mit Metadaten wie Titel und Beschreibung erfassen, um diese Problemstellung mit
anderen zu teilen.

**Schätzung:** 2

**Priorität:** 1


## Client

### assets
- [story1.html](story1.html)

### Code

	if Meteor.isClient
	
		initProblem = (page)->
			Session.set 'problemID', page.params._id

		@Router.pages
			'/': to: 'homePage', as: 'root'
			'/problem/:_id': to: 'problemPage', before: [initProblem]




#### Entscheidungsproblem erfassen

		Template.createProblem.events = 
			"click .save": ->
				title = $(".createProblem .title").val()
				description = $(".createProblem .description").val()
				Problems.insert title: title, description: description

		Template.allProblems.problems = ->
			Problems.find()

		Template.problemSnippet.problem = ->
			Problems.findOne _id: Session.get 'problemID'


