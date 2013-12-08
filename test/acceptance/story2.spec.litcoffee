# Story 2

load setup code

	{loadDriver:loadDriver, webdriver: webdriver} = require "./setup"
	Constants = require "./constants"
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
			solutionContainer = getSolutionContainer()
			
			solutionContainer.findElement(webdriver.By.className('title')).getAttribute("value").then (title) ->
				expect(title).toBe ""
				solutionContainer.findElement(webdriver.By.className('description')).getAttribute("value").then (description) ->
					expect(description).toBe ""
					done()

helper functions

		getSolutionContainer = ->
			driver.findElement(webdriver.By.className("addSolution"))

		getTitleOfProblemPage = ->
			deferred = webdriver.promise.defer();
			driver.findElement(webdriver.By.tagName "h3").getText().then deferred.resolve
			deferred.promise

		createSolution = ->
			deferred = webdriver.promise.defer();
			solutionTitle = "my solution"
			solutionDescription = "this is a solution for the problem"
			solutionContainer = getSolutionContainer()
			
			solutionContainer.findElement(webdriver.By.className('title')).sendKeys Constants.SOLUTION_TITLE
			solutionContainer.findElement(webdriver.By.className('description')).sendKeys Constants.SOLUTION_DESCRIPTION
			solutionContainer.findElement(webdriver.By.className("save")).click()
			deferred.resolve()
			deferred.promise
