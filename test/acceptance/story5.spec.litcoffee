# Story 5

load setup code

	{loadDriver:loadDriver, webdriver: webdriver} = require "./setup"
	Constants = require "./constants"

the tests


	describe "story5", ->
		driver = false
		beforeEach -> runs -> waitsFor -> driver = loadDriver()

		it "allows users to open a page where they can rate a solution", (done) ->

			driver.findElement(webdriver.By.xpath '//a[starts-with(@href, "./solution")]').click().then ->
				done()
		it "allows to save a rating for a solution", (done) ->
			driver.findElement(webdriver.By.className "save").click().then ->
				done()

		it "enables a user to see the rating he gave", (done) ->
			driver.findElement(webdriver.By.xpath "//ol/li/span").getText().then (text) ->
				expect(text).toBe "50"
				done()



		