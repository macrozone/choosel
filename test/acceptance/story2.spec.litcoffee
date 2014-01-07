# Story 2

load setup code

	{loadDriver:loadDriver, webdriver: webdriver} = require "./setup"

the tests


	describe "story2", ->
		driver = false
		beforeEach -> runs -> waitsFor -> driver = loadDriver()

		it "allows user to open a page for a problem", (done) ->
			element = driver.findElement(webdriver.By.className('problemList'))
			element.findElement(webdriver.By.tagName("a")).click().then ->
				getTitleOfProblemPage().then (title) ->
					expect(title).toBe "my problem"
					done()

		it "allows a user to add a solution for a problem", (done) ->
			createSolution().then done

		it "has an empty form when a solution is saved", (done) ->
			solutionContainer = helpers.getSolutionContainer driver
			
			solutionContainer.findElement(webdriver.By.className('title')).getAttribute("value").then (title) ->
				expect(title).toBe ""
				solutionContainer.findElement(webdriver.By.className('description')).getAttribute("value").then (description) ->
					expect(description).toBe ""
					done()

