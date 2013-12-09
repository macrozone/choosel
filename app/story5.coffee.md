# Lösungen bewerten


Als Bewerter möchte ich alle Lösungsvarianten für ein bestimmtes Problem nach meinen 
Individuellen Kriterien bewerten können, 
um die für mich beste Lösung zu finden.

**Priorität:** 5

**Schätzung:** 5

## Akzeptanzkriterien:

**Kriterium "Bewertungskriterien bewerten"**<br>
Situation: Bewertungskriterien wollen verschieden bewertet werden<br>
Aktion: Mit einem Schieberegler (0% - 100%) wird das Bewertungskriterium bewertet<br>
Erwartetes Ergebnis: Jede Bewertung eines Bewertungskriteriums in einer Lösung wird temporär gespeichert

**Kriterium "Inviduelle Bewertungskriterien pro Lösung"**<br>
Situation: Es existieren erfasste Bewertungskriterien pro Problem<br>
Aktion: Bewertung eines Bewertungskriteriums wird gespeichert<br>
Erwartetes Ergebnis: Pro Lösung ist jede Bewertung eines Bewertungskriterium unabhängig von einer anderen Lösung




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

~~User can click on a solution (from [story2](story2.coffee.md)), this opens this page~~

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
			Criteria.find {problemID: Session.get("problemID"), userID: Meteor.userId()}


## Task

User should be able to rate the solution with everycriteria

this should be done with a slider (from 0% to 100% fullfilled, may have steps)

radio-buttons are ok too (keep it simple!)

--> reuse weightSlider



		Template.solutionScoreSlider.rendered = ->
			criterium = this.data
			INITIAL_SCORE = 50

			$element = $(this.find(".scoreSlider"))

			setScore = (value) =>
				$element.data "score", value
				$(this.find(".badge")).text value+"% fullfilled"

			setScore INITIAL_SCORE

			$element.data "weight", criterium.weight
			$element.slider min:0, max:100, value: INITIAL_SCORE
			$element.on "slide", (event, ui) =>
				setScore ui.value
				



## Task

rate this solution:

for each criteria, calculate:

r_i = percentage_i * weight_i

calculate the result

r = sum (r_i) / sum(weight_i)

		Template.totalScore.score = -> 
			Math.round Session.get "totalScore"

		Template.criteriaListWithRatings.rendered = ->

			saveRatingInSession = =>
				sumWeight = 0 
				sumScore = 0
				$elements = $(this.findAll(".scoreSlider"))
				$elements.each (index, element) =>
					weight = $(element).data "weight"
					sumWeight += weight
					score = $(element).data "score"
					sumScore += score*weight
				totalScore = sumScore / sumWeight
				Session.set "totalScore", totalScore

			$(this.findAll(".scoreSlider")).on "slide", saveRatingInSession 
			# execute once
			saveRatingInSession()

## Task

verify this calculation ;-)

## Task

~~save rating to the solution-collection (update solution)~~

we have now users, we create a new Ratings collection

-> done in story0

		Template.criteriaListWithRatings.events =
			"click .save": ->

				currentSolution = Solutions.findOne _id: Session.get "solutionID"
				score = Math.round Session.get "totalScore"

check if this rating was already set

				query = solutionID: Session.get("solutionID"), userID: Meteor.userId()
				rating = Ratings.findOne query
				if rating?
					Ratings.update {_id: rating._id}, $set: score: score
				else
					query.score = score
					Ratings.insert query

go back to problem page after saving

				Meteor.go "/problem/"+(Session.get "problemID")+"/"






