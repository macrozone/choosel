
webdriver = require 'selenium-webdriver'
driver = require('../rtd/webdrivers/selenium-server.js') webdriver, browserName: "chrome"
	

resetApp = ->
	deferred = webdriver.promise.defer()
	driver.get("http://localhost:8000/reset").then ->
		deferred.resolve()
	deferred.promise

openApp = ->
	deferred = webdriver.promise.defer()
	driver.get("http://localhost:8000").then ->
		deferred.resolve()
	deferred.promise


beforeEach ->
	resetApp().then openApp

createNewProblem = ->
	deferred = webdriver.promise.defer();
	problemTitle = "my problem"
	problemDescription = "this is a problem i want to solve"
	driver.findElement(webdriver.By.className('title')).sendKeys problemTitle
	driver.findElement(webdriver.By.className('description')).sendKeys problemDescription
	driver.findElement(webdriver.By.className("save")).click()
	deferred.resolve()

	return deferred.promise

checkListContent = ->
	deferred = webdriver.promise.defer();
	
	element = driver.findElement(webdriver.By.className('problemList')).getText().then deferred.resolve
	deferred.promise

describe "story1", ->


	it "is has empty problem list first", (done) ->
	
		checkListContent().then (content) ->
			expect(content.length).toBe 0
			done()


	it "lets a user create a new problem that is saved", (done) ->
		createNewProblem().then ->
			checkListContent().then (content) ->
				expect(content.length).toBeGreaterThan 0
				done()
		
