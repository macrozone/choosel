# Kriterien priorisieren


Als Bewerter möchte ich meine Individuellen Kriterien priorisieren um sie unterschiedlich zu gewichten.

**Priorität:** 4

**Schätzung:** 3

## Akzeptanzkriterien:

**Kriterium "Priosierung der Bewertungskriterien"**<br>
Situation: Es existieren erfasste Bewertungskriterien pro Problem<br>
Aktion: Jedes Bewertungskriterium kann für das ganze Problem gewichtet werden<br>
Erwartetes Ergebnis: Gewichtung der Bewertungskriterien werden pro Problem gespeichert und ist in den Problemlösungen sichtbar

## assets
- [story4.html](story4.html)

	if Meteor.isClient


## Task 
create template to edit weights for the criterias of [story3](story3.coffee.md)
	
		Template.weightSlider.rendered = ->

			criterium = this.data
			$(this.find(".weightSlider")).each (index, element) =>
				$(element).slider min:1, max:10, value: criterium.weight 
			

## Task
store these weights to the criterias

				$(element).on "slide", (event, ui) =>
					$(this.find(".label")).text ui.value
					criteria.update {_id: criterium._id}, $set: weight: ui.value

					
		


