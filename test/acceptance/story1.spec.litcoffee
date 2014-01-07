# Story 1

load setup code

	{loadDriver:loadDriver, webdriver: webdriver, helpers: helpers} = require "./setup"
	Constants = require "./constants"

##the test

these are [jasmine-tests](http://pivotal.github.io/jasmine/). They read like descriptions of the story

	describe "story1", ->


we first need to load the driver. This looks a little bit ugly, 
but we need to have driver defined in this scope here

jasmines waitsFor can block the code until the driver is defined


		driver = false
		beforeEach -> runs -> waitsFor -> driver = loadDriver()



the tests itself, that describe this story

		it "allows a user to sign in", (done) ->
			
			driver.findElement(webdriver.By.id("login-buttons")).click().then ->
				driver.findElement(webdriver.By.id("login-email")).sendKeys "foo@example.com"
				driver.findElement(webdriver.By.id("login-password")).sendKeys "bar"
				driver.findElement(webdriver.By.id("login-buttons-password")).click().then ->
					driver.findElement(webdriver.By.id("login-name-link")).getText().then (text) ->
						expect(text).toBe "foo ▾"
						done()
			
			
	

		it "is has empty problem list first", (done) ->
			helpers.checkListContent(driver, "problemList").then (content) ->
				expect(content.length).toBe 0
				done()

		it "lets a user create a new problem that is saved", (done) ->
			helpers.createNewProblem(driver, Constants.PROBLEM_TITLE, Constants.PROBLEM_DESCRIPTION).then ->
				helpers.checkListContent(driver, "problemList").then (content) ->
					expect(content.length).toBeGreaterThan 0
					done()
