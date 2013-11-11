# Story 0: General Setup

This is the setup-file that contains code for every Story.

this is a [litertate-coffe-script](http://coffeescript.org/#literate) file!

indented code is real program code, but everything here is normal markdown
See 


## global Collections

	@Problems = new Meteor.Collection "problems"
	@Solutions = new Meteor.Collection "solutions"

## Client

	if Meteor.isClient


### Handlebar helpers
Handlebars is a template language and meteor's default one, 
see http://handlebarsjs.com/

you can register helper functions
this example here just logs something and can be used like this

{{log problem}}

then, the template-var problem will be logged in the console
	
	
		Handlebars.registerHelper 'log', (data) -> console.log data


### Router init

Define Routes in every Story
		@Router = new Meteor.PageRouter
