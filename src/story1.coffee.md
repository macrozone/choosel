# Story 1: Entscheidungsproblem erfassen

Als Problemsteller möchte ich ein Entscheidungsproblem mit Metadaten wie Titel und Beschreibung erfassen, um diese Problemstellung mit
anderen zu teilen.

**Schätzung:** 2

**Priorität:** 1


## Akzeptanzkriterien:

**Kriterium "Entscheidungsproblem werden persistent erfasst"**<br>
Situation: Es existiert ein Problem, das ein Titel und eine Beschreibung hat<br>
Aktion: Titel und Beschreibung des Problems werden in jeweils getrennten Textfelder erfasst<br>
Erwartetes Ergebnis: Titel und Beschreibung des Problems werden persistent gespeichert und dargestellt

**Kriterium  "Formular ist leer nach Eingabe"**<br>
Situation: Problem wurde erfasst<br>
Aktion: Save Button wurde geklickt<br>
Erwartetes Ergebnis: Problem Formular ist wieder leer<br>

**Kriterium  "Entscheidungsproblem mit anderen teilen"**<br>
Situation: Es existiert ein Problem, das mit einem Titel und Beschreibung erfasst worden ist<br>
Aktion: Andere als der Erfasser können sich das Problem ansehen<br>
Erwartetes Ergebnis: Titel und Beschreibung des Problems werden werden anderen angezeigt/dargestellt<br>

**Kriterium  "Fehleingaben werden abgefangen (leere Felder)"**<br>
Situation: Es wird kein Titel oder Beschreibung eingegeben<br>
Aktion: Es wird mit leeren Feldern der Save geklickt<br>
Erwartetes Ergebnis: Popup erscheint mit Meldung, dass kein Titel bzw. Beschreibung eingeben wurde. Es wird nichts abgespeichert<br>

## assets
- [story1.html](story1.html)


## define routes for pages

	if Meteor.isClient
	
		initProblem = (page)->
			Session.set 'problemID', page.params._id

		@Router.pages
			'/': to: 'homePage', as: 'root'
			'/problem/:_id': to: 'problemPage', before: [initProblem]




## Entscheidungsproblem erfassen

		Template.createProblem.events = 
			"click .save": ->
				title = $(".createProblem .title").val()
				description = $(".createProblem .description").val()

validate fields

				if title.length <= 0 or description.length <= 0
					alert "please set title and description"

save Data if ok

				else 
					Problems.insert title: title, description: description

empty the fields afterwards
				
					$(".createProblem .title").val ""
					$(".createProblem .description").val ""


		Template.allProblems.problems = ->
			Problems.find()

		Template.problemSnippet.problem = ->
			Problems.findOne _id: Session.get 'problemID'


