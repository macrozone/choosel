# Abfrage terminieren


Als Problemsteller möchte ich eine Deadline für das Bewerten meiner Lösungsvorschläge festlegen, 
um Planungssicherheit zu haben.

**Priorität:** 10

**Schätzung:** 5


## Task 

add a date field to the problem creation form for termination and store this date to the problem

--> add field in story1
--> stored in database

## Task 

if date is in past, user can't add solutions anymore

--> we register a handlebar helper for that that uses the current problemID in session

you can use this handler like this in a template:

{{#if problemHasExpired}}
	<p>problem has been expired, you can't edit anymore</p>
{{else}}
	{{>addSolution}}
{{/if}}


	if Meteor.isClient
		Handlebars.registerHelper 'problemHasExpired', ->

			now = new Date().getTime()/1000
			problem = Problems.findOne _id: Session.get "problemID"

			if not problem? 
				true
			else if not problem.enddate?
				false
			else if problem.enddate > now 
				false
			else
				true


--> used in story2 mainly
