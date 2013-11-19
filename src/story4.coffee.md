# Kriterien priorisieren


Als Bewerter möchte ich meine Individuellen Kriterien priorisieren um sie unterschiedlich zu gewichten.

**Priorität:** 4

**Schätzung:** 3



	if Meteor.isClient

		



## Task 
create template to edit weights for the criterias of [story3](story3.coffee.md)



	
		Template.oneWeight.rendered = ->

			criterium = this.data
			$(this.find(".weightSlider")).each (index, element) =>
				$(element).slider min:1, max:10, value: criterium.weight 
				$(element).on "slide", (event, ui) =>
					$(this.find(".label")).text ui.value
					criteria.update {_id: criterium._id}, $set: weight: ui.value

					
		


## Task
store these weights to the criterias