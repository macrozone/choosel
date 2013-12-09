# Bewertungskriterien erfassen


Als Bewerter möchte ich individuelle Bewertungskriterien für mögliche Problemlösungen erfassen können.


**Priorität:** 3

**Schätzung:** 3


## Akzeptanzkriterien:

**Kriterium "Bewertungskriterien erfassen"**<br>
Situation: Es existieren eine oder mehrere Bewertungskriterien pro Problem<br>
Aktion: Bewertungskriterien können per Textfeld erfasst werden<br>
Erwartetes Ergebnis: Bewertungskriterien werden persistent pro Problem gespeichert

**Kriterium "Bewertungskriterien in Lösung sichtbar"**<br>
Situation: Es existieren erfasste Bewertungskriterien<br>
Aktion: Lösungen des Problems werden angesehen<br>
Erwartetes Ergebnis: Bewertungskriterien des Problems sind in jeder Lösung sichtbar


## assets
- [story3.html](story3.html)


## Client

	if Meteor.isClient

## Task

store criterias

criterias are no longer volatile anymore, so the collection is now defined in [story0](story0.coffee.md)


	

## Task

create new template or page where a visitor set his criterias

		initCriteriaPage = (page) ->
			Session.set "problemID", page.params._id

		@Router.pages
			'/problem/:_id/criteria': to: 'criteriaPage', before: initCriteriaPage

			Template.criteriaList.criteria = ->

				Criteria.find {problemID: Session.get("problemID"), userID: Meteor.userId()}

			Template.addCriteria.events =
				"click .save": ->
					title = $(".addCriteria .criteria").val()

validate
					
					if title.length <= 0
						alert "please set a name for the criterium"
					else
						criterium = title: title, weight: 5, userID: Meteor.userId(), problemID: Session.get "problemID"
						Criteria.insert criterium
						$(".addCriteria .criteria").val ""

## Task 

append template or link to page to problem page

--> added <a href="criteria/">Edit your criteria</a> in story2.html (the problem page)


				




