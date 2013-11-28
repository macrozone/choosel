# Story 2: Lösungsvarianten erfassen


Als Problemsteller möchte ich Lösungsvarianten mit Metadaten für ein Problem erfassen, um Alternativen im Blick zu behalten.


**Priorität:** 2

**Schätzung:** 3


## Akzeptanzkriterien:

**Kriterium "Lösungsvarianten werden persistent erfasst"**<br>
Situation: Es existiert ein Lösung zu einem bestimmten Problem, das ein Titel und eine Beschreibung hat<br>
Aktion: Titel und Beschreibung der Lösung werden in jeweils getrennten Textfelder erfasst<br>
Erwartetes Ergebnis: Titel und Beschreibung der Lösung werden persistent gespeichert und dargestellt

**Kriterium  "Formular ist leer nach Eingabe"**<br>
Situation: Lösung wurde erfasst<br>
Aktion: Save Button wurde geklickt<br>
Erwartetes Ergebnis: Lösungs Formular ist wieder leer<br>

**Kriterium  "Lösungsvarianten mit anderen teilen"**<br>
Situation: Es existiert ein Lösung, das mit einem Titel und Beschreibung erfasst worden ist<br>
Aktion: Andere als der Erfasser können sich die Lösung ansehen<br>
Erwartetes Ergebnis: Titel und Beschreibung der Lösung werden werden anderen angezeigt/dargestellt<br>

**Kriterium  "Fehleingaben werden abgefangen (leere Felder)"**<br>
Situation: Es wird kein Titel oder Beschreibung eingegeben<br>
Aktion: Es wird mit leeren Feldern der Save geklickt<br>
Erwartetes Ergebnis: Popup erscheint mit Meldung, dass kein Titel bzw. Beschreibung eingeben wurde. Es wird nichts abgespeichert<br>

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
			cursor = Solutions.find {problemID: Session.get('problemID')}, sort: title: 1

add already rated solution-scores from story5
			
			solutionsRated = Session.get "solutionsRated"
			solutions = []
			cursor.forEach (solution)->
				
				if solutionsRated?
					solution.userRating = solutionsRated[solution._id]
				solutions.push solution

			solutions

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
