# Choosel

aka LPO - Least P*ss Off - a Decision making tool

A Project for the ZHAW school


## Literate-Story-Programming

I've known [coffescript](http://coffeescript.org/) for a while and stumbled accross the concept of
[literate Programming](http://de.wikipedia.org/wiki/Literate_programming), 
which is supported by coffeescript with 
[Literate coffescript](http://coffeescript.org/#literate) - a mix of coffescript code and markdown comments.

So I came up with the idea to merge to concept of literate-programming with stories from agile programming.

### How it works

We distribute code not in modules, but in story-cards! The application code is *in* the story-Cards.

Need to check the progress for a story? Simply open the storycard and verify the code.

Want to define tasks for a story? Put some headings and comments in your story card. 
The task can be done by writing the code directly where you defined your task.

### Stories
#### [story 0](src/story0.coffee.md) 
This story card card contains code that is setup code and is shared across different stories. 
If you need to adjust code in story 0, add a commet in your story card.


#### [story 1](src/story1.coffee.md) 

#### [story 2](src/story2.coffee.md) 

more (all) stories will be put here later.


### additional assets
html-files and css files, that belong to a story are named like this:

storyX.html, storyX.css, etc.

images and other assets will be under /public

## Framework
Simple ideas need simple code - we now use [meteor](http://www.meteor.com/)!

Meteor has a lot of simple approaches to organize code wich helps us with this concept of literate-story-programming. 


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

3. `$ cd choosel/src`

4. execute `$ mrt` to install the needed packages

5. execute `mrt` or `meteor` to run the app in development mode

6. goto http://localhost:3000



