# Story 3

load setup code

	{loadDriver:loadDriver, webdriver: webdriver} = require "./setup"
	Constants = require "./constants"

the tests


	describe "story3", ->
		driver = false
		beforeEach -> runs -> waitsFor -> driver = loadDriver()

		it "allows users to open a page where they can edit the criteria", (done) ->

			driver.findElement(webdriver.By.xpath '//a[@href="criteria/"]').click().then ->
				done()

		it "has a form to add a criteria", (done) ->
			driver.findElement(webdriver.By.className "criteria" ).sendKeys Constants.CRITERIUM
			driver.findElement(webdriver.By.className "save").click().then ->
				driver.findElement(webdriver.By.tagName "ol").getText().then (text) ->
					expect(text.length).toBeGreaterThan 0
					done()
		

		it "has a back button to go back to the problem", (done) ->
			driver.findElement(webdriver.By.className "backButton").click().then ->
				done()