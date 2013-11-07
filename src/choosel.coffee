
Problems = new Meteor.Collection "problems"

if Meteor.isClient


	Template.createProblem.events = 
		"click .save": ->

			title = $(".createProblem .title").val()
			description = $(".createProblem .description").val()
			Problems.insert title: title, description: description

	Template.allProblems.problems = ->
		Problems.find()