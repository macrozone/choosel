# Kriterien priorisieren


Als Bewerter möchte ich meine Individuellen Kriterien priorisieren um sie unterschiedlich zu gewichten.

**Priorität:** 4

**Schätzung:** 3



	if Meteor.isClient

		@Router.pages
			'/': to: 'homePage', as: 'root', layout: "homeLayout"
			'/problem/:problemID/criteria': to: 'criteriaPage'



## Task 
create template to edit weights for the criterias of [story3](story3.coffee.md)

		Template.criteriaPage.criteria = ->
			["bla", "blubb", "blubber"]

	
		Template.criteriaPage.events = 
			"blur input.weight": (event)->
			
				console.log $(event.target).val()


## Task
store these weights to the criterias