
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




module.exports = 
	webdriver: webdriver
	driver: driver
	resetApp: resetApp
	openApp: openApp