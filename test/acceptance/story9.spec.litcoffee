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
				done()
				
now search the solution list



		


		