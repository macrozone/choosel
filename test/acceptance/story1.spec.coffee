
webdriver = require 'selenium-webdriver'
driver = require('../rtd/webdrivers/selenium-server.js') webdriver, browserName: "chrome"
		


openApp = ->
	deferred = webdriver.promise.defer()
	driver.get("http://localhost:8000").then ->
		deferred.resolve()
	deferred.promise

describe "story1", ->

	beforeEach ->
		openApp()

	it "lets a user create a new problem", (done)->
		problemTitle = "my problem"
		problemDescription = "this is a problem i want to solve"
		driver.findElement(webdriver.By.className('title')).sendKeys problemTitle
		driver.findElement(webdriver.By.className('description')).sendKeys problemDescription
		driver.findElement(webdriver.By.className("save")).click()
		done()
