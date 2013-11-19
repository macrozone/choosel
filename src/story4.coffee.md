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

create a local criteria collection

		criteria =  new Meteor.Collection
		criteria.insert weight:5, name:"grösse"
		criteria.insert weight:5, name:"kraft"
		criteria.insert weight:5, name:"geschwindigkeit"

fill with test data
		
		Template.criteriaPage.criteria= -> criteria.find {}
			

## Task
store these weights to the criterias

		Template.oneWeight.rendered = ->

			criterium = this.data
			$(this.find(".weightSlider")).each (index, element) =>
				$(element).slider min:1, max:10, value: criterium.weight 
				$(element).on "slide", (event, ui) =>
					$(this.find(".label")).text ui.value
					criteria.update {_id: criterium._id}, $set: weight: ui.value

					
		


