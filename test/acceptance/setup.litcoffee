# setup for the acceptance tests

this file is inspired by [a sample from the rtd-github-repo](https://github.com/xolvio/meteor-rtd-example-project/blob/master/test/acceptance/leaderboard.spec.js)

    webdriver = require 'selenium-webdriver'
    request = require('request')
    Constants = require "./constants"

    driver = false
    browserName = 'chrome'


    deleteWebdriverSession = (sessionId) ->
        request.del {
            url: 'http://localhost:4444/wd/hub/session/' + sessionId,
            headers: {
                'Accept': 'application/json'
            }
        }, null
    deleteWebdriverSessions =  (sessions) ->
        for session in sessions
            deleteWebdriverSession session.id


    getWebdriverSessions = ->
        deferred = webdriver.promise.defer()
        request.get {
            url: 'http://localhost:4444/wd/hub/sessions',
            headers: {
                'Content-type': 'application/json'
            }
        }, (error, response, body) ->
            deferred.resolve JSON.parse(body).value
        deferred.promise

    getWebdriverSessionStatus = (sessionId, callback) ->
        deferred = webdriver.promise.defer()
        request.get {
            url: 'http://localhost:4444/wd/hub/session/' + sessionId + '/url',
            headers: {
                'Content-type': 'application/json'
            }
        }, (error, response) ->
            deferred.resolve response.statusCode
        deferred.promise

    reuseOrCreateSession = (sessions) ->
        deferred = webdriver.promise.defer()

        if sessions.length == 0
            driver = require('../rtd/webdrivers/selenium-server.js') webdriver, browserName: browserName
            driver.manage().timeouts().setScriptTimeout 2000
            driver.manage().timeouts().implicitlyWait 2000
            deferred.resolve driver

        else
            tempDriver = require('../rtd/webdrivers/selenium-server.js') webdriver, browserName: browserName, sessions[0].id
            getWebdriverSessionStatus(sessions[0].id).then (status)->
                if status != 200
                    deleteWebdriverSessions sessions
                    tempDriver = require('../rtd/webdrivers/selenium-server.js') webdriver, browserName: browserName

                tempDriver.manage().timeouts().setScriptTimeout 2000
                tempDriver.manage().timeouts().implicitlyWait 2000
                driver = tempDriver
                deferred.resolve driver
        deferred.promise



    initWebDriverSession = ->
        deferred = webdriver.promise.defer()
        getWebdriverSessions().then (sessions) ->
            reuseOrCreateSession(sessions).then deferred.resolve
        deferred.promise



    initDriver = ->
        deferred = webdriver.promise.defer()
        initWebDriverSession().then (theDriver) ->
            resetApp().then ->
                openApp().then ->
                    driver = theDriver

    openApp = ->
        deferred = webdriver.promise.defer()
        driver.get("http://localhost:8000").then deferred.resolve
        deferred.promise

    resetApp = ->
        deferred = webdriver.promise.defer()
        driver.get("http://localhost:8000/reset").then deferred.resolve
        deferred.promise


    initDriver()

    loadDriver = -> driver


some reusable helper functions

  
    createNewProblem = (driver, title, description) ->
        deferred = webdriver.promise.defer()
        driver.findElement(webdriver.By.className('title')).sendKeys title
        driver.findElement(webdriver.By.className('description')).sendKeys description
        driver.findElement(webdriver.By.className("save")).click().then deferred.resolve
        deferred.promise

    checkListContent = (driver, classname) ->
        deferred = webdriver.promise.defer()
       
        driver.findElement(webdriver.By.className(classname)).getText().then deferred.resolve
        deferred.promise

    getSolutionContainer = (driver)->
        driver.findElement(webdriver.By.className("addSolution"))

    getTitleOfProblemPage = (driver)->
        deferred = webdriver.promise.defer();
        driver.findElement(webdriver.By.tagName "h3").getText().then deferred.resolve
        deferred.promise

    createSolution = (driver, title, description)->
        deferred = webdriver.promise.defer();
        solutionContainer = getSolutionContainer driver
        
        solutionContainer.findElement(webdriver.By.className('title')).sendKeys title
        solutionContainer.findElement(webdriver.By.className('description')).sendKeys description
        solutionContainer.findElement(webdriver.By.className("save")).click()
       
        deferred.resolve()
        deferred.promise


    module.exports = 
        helpers: 
            checkListContent: checkListContent
            createNewProblem: createNewProblem
            getSolutionContainer: getSolutionContainer
            getTitleOfProblemPage: getTitleOfProblemPage
            createSolution: createSolution
        loadDriver: loadDriver
        webdriver: webdriver



