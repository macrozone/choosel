# Choosel

aka LPO - Least P*ss Off - a Decision making tool

A Project for the ZHAW school.

Current state: http://choosel.macrozone.ch/

## What's new?

- now uses [RTD](http://xolvio.github.io/rtd/) for unittests and acceptance tests
- has now some first acceptance tests, see [story1.spec](test/story1.spec.coffee) and [story2.spec](test/story2.spec.coffee)

## "Literate-Story-Programming"

I've known [coffescript](http://coffeescript.org/) for a while and stumbled accross the concept of
[literate Programming](http://de.wikipedia.org/wiki/Literate_programming), 
which is supported by coffeescript with 
[Literate coffescript](http://coffeescript.org/#literate) - a mix of coffescript code and markdown comments.

So I came up with the idea to merge to concept of literate-programming with stories from agile programming.

### How it works

We distribute code not in modules, but in story-cards! The application code is *in* the story-Cards.

Regard the application like a book, with Chapters and Subchapters. A User-Story whould therefore be a Chapter, 
and a Task a Subchapter.

Need to check the progress for a story? Simply open the storycard and verify the code.

Want to define tasks for a story? Put some headings and comments in your story card. 
The task can be done by writing the code directly where you defined your task - as a Subchapter.

### Things to consider
Let's see if this approach will work successfully throughout the whole project. 

Of course it needs the code to be simple and the stories well defined. 
If you need to adjust previous stories in order to make your current story work, it might not be well defined.

Also, the maintainability of the project may be decreased. On the other hand, you will find
code very easy, if you know which story to edit.

Code that is too long or complicated for a story should be put in it's own module / package / project anyway, 
but that won't be the case in this particlar project.

### Stories
#### [story 0, "the prologue"](src/story0.coffee.md) 
This story card card contains code that is setup code and is shared across different stories. 
If you need to adjust code in story 0, add a commet in your story card.


#### [story 1](src/story1.coffee.md) 

#### [story 2](src/story2.coffee.md) 

#### [story 3](src/story3.coffee.md) 

#### [story 4](src/story4.coffee.md) 

#### [story 5](src/story5.coffee.md) 

more (all) stories will be put here later.


### additional assets
html-files and css files, that belong to a story are named like this:

storyX.html, storyX.css, etc.

images and other assets will be under /public

## [meteor](http://www.meteor.com/)
Because simple ideas need simple code.

Meteor has a lot of simple approaches to organize code wich helps us with this concept of literate-story-programming. 

It also abstracts away the border between client and server code (at least mostly). 

### Unit Tests & Integration Tests

Official Meteor Unit-Test-System is on the Roadmap, but not available yet.

But there are some Systems already available:

- [RTD](http://xolvio.github.io/rtd/) - Unit Tests and Acceptance Tests, 
runs automatically in the background and will update itself when you change a file.
- [Laika](http://arunoda.github.io/laika/)

We will add such a system in one of the next Iterations.

## Team

* Tobias Rees

* Marco Wettstein

* Idea: Constantin Lazari 

## Project Site

[Choosel Project](https://projects.zoho.com/portal/zhawrees/newlogin.do?newlogin=true#dashboard/642855000000015005)


## Howto install

1. install meteor
`$ curl https://install.meteor.com | sh`

2. install [meteorite](http://oortcloud.github.io/meteorite/) (needs [npm](https://npmjs.org/))
`$ npm install -g meteorite`

2. clone the repository locally: 
`$ git clone https://github.com/macrozone/choosel`

3. Install `nodejs-legacy`, if haven't it, because `mrt` needs it to run correct

4. `$ cd choosel/src`

5. execute `$ mrt` to install the needed packages

6. execute `mrt` or `meteor` to run the app in development mode

7. goto http://localhost:3000



