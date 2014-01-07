# Story 9

load setup code

	{loadDriver:loadDriver, webdriver: webdriver, helpers: helpers} = require "./setup"
	Constants = require "./constants"

the tests


	describe "story9", ->
		driver = false
		beforeEach -> runs -> waitsFor -> driver = loadDriver()

**Kriterium "Schnellzugriff auf Probleme des users"**
Situation: User möchte die Lösungen für **seine** gestarteten Probleme sehen
Aktion: User ist auf Homepage
Erwartetes Ergebnis: User sieht liste seiner gestarteten Probleme

		it "allows user to see the problem he started in a list", (done) ->

		

			driver.navigate().to("http://localhost:8000/").then ->
				helpers.checkListContent(driver, "myproblemList").then (content) ->
					expect(content.length).toBeGreaterThan 0
					done()


**Kriterium "Top Lösung"**
Situation: User möchte sofort sehen, welche Lösung zu seinem Problem am besten abgeschnitten hat
Aktion: User klickt auf ein Problem
Erwartetes Ergebnis: Lösung mit höchstem Score ist zuoberst.


		it "shows the top solution of a problem on top of the list of all solutions", (done) ->
			
we first navigate into a problem. let's take the users problem here

			element = driver.findElement(webdriver.By.className('myproblemList'))
			element.findElement(webdriver.By.tagName("a")).click().then ->

create another solution here
				
				helpers.createSolution(driver, Constants.SOLUTION_2_TITLE, Constants.SOLUTION_2_DESCRIPTION).then ->
				
now search the solution list

				list = driver.findElement(webdriver.By.tagName("ol"))
				elements = list.findElements(webdriver.By.tagName("li")).then (elements) ->
					ratingList = []

					onComplete = ->

check if first entry has the highest rating
						
						max = 0
						maxIndex = 0
						for rating, index in ratingList
							if rating > max
								max = rating
								maxIndex = index

						expect(maxIndex).toBe 0
						done()
						
					checkIfComplete = ->
						if ratingList.length == elements.length
							onComplete()

					for element, index in elements
						do (index) ->
						
careful, when calling async functions in a sync for-loop: 
the index-var is defined in the enclosing scope of all the 
callbacks. with "do (index) -> " we get an inner scope
							
							element.findElements(webdriver.By.className("avgRating")).then (ratingElements) ->
								if ratingElements.length > 0
									ratingElements[0].getText().then (rating) ->
										ratingList[index] = parseInt rating, 10
										checkIfComplete()
								else
									ratingList[index] = 0
									checkIfComplete()


					


		


		