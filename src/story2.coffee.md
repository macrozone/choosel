# Story 2: Lösungsvarianten erfassen


Als Problemsteller möchte ich Lösungsvarianten mit Metadaten für ein Problem erfassen, um Alternativen im Blick zu behalten.


**Priorität:** 2

**Schätzung:** 3


## Akzeptanzkriterien:

- eingegebene Daten bleiben persistent nach neuladen der Seite
- andere Nutzer können diese Daten sehen
- Fehleingaben werden abgefangen (leere Felder)
- Formular ist leer nach eingabe



## assets
- [story2.html](story2.html)


## Client

	if Meteor.isClient
		
		initSolutions = (page)->
			Session.set 'solutionsID', page.params._id

		@Router.pages
			'/solutions/:_id': to: 'solutionsPage', before: [initSolutions]



### Lösung zu Problem erfassen

		Template.solutions.solutions = ->
			Solutions.find {problemID: Session.get('problemID')}, sort: title: 1

		Template.addSolution.events = 
			"click .save": ->
				title = $(".addSolution .title").val()
				description = $(".addSolution .description").val()

validate fields
				
				if title.length <= 0 or description.length <= 0
					alert "please set title and description"

save Data if ok

				else 
					Solutions.insert problemID: Session.get('problemID'), title: title, description: description


do not forget to empty the fields after saving
				
					$(".addSolution .title").val ""
					$(".addSolution .description").val ""
