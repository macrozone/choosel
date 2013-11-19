# Lösungen bewerten


Als Bewerter möchte ich alle Lösungsvarianten für ein bestimmtes Problem nach meinen 
Individuellen Kriterien bewerten können, 
um die für mich beste Lösung zu finden.

**Priorität:** 5

**Schätzung:** 5


	if Meteor.isClient

## Task

create a new Page 

		initSolutionPage = (page) ->
			Session.set "problemID", page.params.problemID
			Session.set "solutionID", page.params.solutionID
			Session.set "totalScore", 0

		@Router.pages
			"/problem/:problemID/solutions/:solutionID": to: "solutionPage", before: [initSolutionPage]



## Task

User can click on a solution (from [story2](story2.coffee.md)), this opens this page

--> readded link <a href="./solutions/{{_id}}">{{title}}</a>


## Task

The page shows the title of the problem and the description

--> added problemSnippet in template story5.html

--> consider recycle template from [story1](story1.coffee.md)


## Task

the Page shows title and description of the current solution

		Template.solutionSnippet.solution = ->
			Solutions.findOne _id: Session.get "solutionID"


## Task

The page shows every criteria (stored in Session 
from [story3](story3.coffee.md) and [story4](story4.coffee.md))


		Template.criteriaListWithRatings.criteria = ->
			criteria.find {problemID: Session.get "problemID"}


## Task

User should be able to rate the solution with everycriteria

this should be done with a slider (from 0% to 100% fullfilled, may have steps)

radio-buttons are ok too (keep it simple!)

--> reuse weightSlider



		Template.solutionScoreSlider.rendered = ->
			criterium = this.data
			INITIAL_SCORE = 50

			setLabelByValue = (value) =>
				$(this.find(".label")).text value+"% fullfilled"

			setLabelByValue INITIAL_SCORE

			$(this.find(".scoreSlider")).each (index, element) =>
				$(element).slider min:0, max:100, value: INITIAL_SCORE
				$(element).on "slide", (event, ui) =>
					setLabelByValue ui.value
					



## Task

rate this solution:

for each criteria, calculate:

r_i = percentage_i * weight_i

calculate the result

r = sum (r_i) / sum(weight_i)

		Template.totalScore.score = -> 
			Session.get "totalScore"


		Template.criteriaListWithRatings.rendered = ->
			$elements = $(this.findAll(".scoreSlider"))
			numberOfCriteria = $elements.length

			$(this.find(".scoreSlider")).on "slide", (event, ui) =>
				console.log ui.value

## Task

verify this calculation ;-)

## Task

save rating to the solution-collection (update solution)

		Template.solutionPage.events =
			"click .save": ->

				currentSolution = Solutions.findOne _id: Session.get "solutionID"

				scores = currentSolution.scores
				scores = [] unless scores?
				scores.push Session.get "totalScore"

				Solutions.update {_id: Session.get "solutionID"}, $set: scores: scores







