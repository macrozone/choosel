{loadDriver:loadDriver, webdriver: webdriver} = require "./setup"

describe "story2", ->

	driver = false
	beforeEach -> runs -> waitsFor -> driver = loadDriver()


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
		
		solutionContainer.findElement(webdriver.By.className('title')).sendKeys solutionTitle
		solutionContainer.findElement(webdriver.By.className('description')).sendKeys solutionDescription
		solutionContainer.findElement(webdriver.By.className("save")).click()
		deferred.resolve()
		deferred.promise

	

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
	
		solutionContainer.findElement(webdriver.By.className('title')).getText().then (title) ->
			expect(title).toBe ""
			solutionContainer.findElement(webdriver.By.className('description')).getText().then (description) ->
				expect(description).toBe ""
				done()

