# Story 2: Lösungsvarianten erfassen


Als Problemsteller möchte ich Lösungsvarianten mit Metadaten für ein Problem erfassen, um Alternativen im Blick zu behalten.


**Priorität:** 2

**Schätzung:** 3





## assets
- [story2.html](story2.html)


## Client

	if Meteor.isClient
		
		initSolutions = (page)->
			Session.set 'solutionsID', page.params._id

		@Router.pages
			'/solutions/:_id': to: 'solutionsPage', before: [initSolutions]



### Template functions


#### Lösung zu Problem erfassen

		Template.solutions.solutions = ->
			Solutions.find {problemID: Session.get('problemID')}, sort: title: 1

		Template.addSolution.events = 
			"click .save": ->
				
				title = $(".addSolution .title").val()
				description = $(".addSolution .description").val()
				Solutions.insert problemID: Session.get('problemID'), title: title, description: description

