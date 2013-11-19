# Bewertungskriterien erfassen


Als Bewerter möchte ich individuelle Bewertungskriterien für mögliche Problemlösungen erfassen können.


**Priorität:** 3

**Schätzung:** 3

## assets
- [story3.html](story3.html)


## Client

	if Meteor.isClient

## Task

store criterias

criterias can be volatile for the moment, we do not have to store them in a collection.
But we should store them in Session.

create a local criteria collection

		criteria = new Meteor.Collection
		


## Task

create new template or page where a visitor set his criterias

		initCriteriaPage = (page) ->
			Session.set "problemID", page.params._id

		@Router.pages
			'/problem/:_id/criteria': to: 'criteriaPage', before: initCriteriaPage


			Template.criteriaList.criteria = ->
				criteria.find {problemID: Session.get "problemID"}, sort: weight: -1

			Template.addCriteria.events =
				"click .save": ->
					title = $(".addCriteria .criteria").val()

					criterium = title: title, weight: 5, problemID: Session.get "problemID"
					criteria.insert criterium
					$(".addCriteria .criteria").val ""


## Task 

append template or link to page to problem page

--> added <a href="criteria/">Edit your criteria</a> in story2.html (the problem page)


				




