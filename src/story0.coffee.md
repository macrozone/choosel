# Story 0: The "Prologue"

This is the setup-file that contains code for every Story. It is the "Prologue" of our application

Maybe there will be an "Epilogue" too ;-)


## global Collections

	@Problems = new Meteor.Collection "problems"
	@Solutions = new Meteor.Collection "solutions"

## Client


### assets
- [story0.html](story0.html)
- [story0.css](story0.css)

### Code

	if Meteor.isClient

The following indented code is client code.
We could put them in a folder "client", but we try to let this project as flat as possible 
with code distributed to stories. Because we might later need server code, we'd like to have them in the same place


### Handlebar helpers
[Handlebars](http://handlebarsjs.com/) is a template language and meteor's default one.

You can register helper functions like this: 
		
		Handlebars.registerHelper 'log', (data) -> console.log data


this example here just logs something and can be used like this

{{log problem}}

then, the template-var problem will be logged in the console
	
	
		

### Router init, 

uses [mini-pages](ttps://github.com/cmather/meteor-mini-pages)

Define Routes in every Story
		
		@Router = new Meteor.PageRouter
