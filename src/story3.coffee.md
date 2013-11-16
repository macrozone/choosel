# Bewertungskriterien erfassen


Als Bewerter möchte ich individuelle Bewertungskriterien für mögliche Problemlösungen erfassen können.


**Priorität:** 3

**Schätzung:** 3

## assets
- [story3.html](story3.html)


## Client

	if Meteor.isClient




## Task

create new template or page where a visitor set his criterias

		 Template.criterias.criterias = ->
                        Criterias.find {criteriaID: Session.get('criteriaID')}, sort: title: 1

	                Template.addCriteria.events =
                        "click .save": ->

                                title = $(".addCriteria .criteria").val()
				radio =  $(".addCriteria .radio").val()
				criteriaID: Session.get('criteriaID'), title: title, radio: radio
				Session.set("criteriaID", "test");	

## Task 

append template or link to page to problem page

## Task

store criterias

criterias can be volatile for the moment, we do not have to store them in a collection.
But we should store them in Session.






