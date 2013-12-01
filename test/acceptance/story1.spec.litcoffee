# Story 1

load setup code

	{loadDriver:loadDriver, webdriver: webdriver} = require "./setup"

the tests / descriptions of the story

	describe "story1", ->


we first need to load the driver. This looks a little bit ugly, 
but we need to have driver defined in this scope here

yasmines waitsFor can block the code until the driver is defined


		driver = false
		beforeEach -> runs -> waitsFor -> driver = loadDriver()


		it "is has empty problem list first", (done) ->
			checkListContent().then (content) ->
				expect(content.length).toBe 0
				done()


		it "lets a user create a new problem that is saved", (done) ->
			createNewProblem().then ->

				checkListContent().then (content) ->
					expect(content.length).toBeGreaterThan 0
					done()
		
helper functions

		# help functions
		createNewProblem = ->
			deferred = webdriver.promise.defer();
			problemTitle = "my problem"
			problemDescription = "this is a problem i want to solve"
			driver.findElement(webdriver.By.className('title')).sendKeys problemTitle
			driver.findElement(webdriver.By.className('description')).sendKeys problemDescription
			driver.findElement(webdriver.By.className("save")).click().then deferred.resolve
			deferred.promise

		checkListContent = ->
			deferred = webdriver.promise.defer()
			driver.findElement(webdriver.By.className('problemList')).getText().then deferred.resolve
			deferred.promise