# Choosel

aka LPO - Least P*ss Off - a Decision making tool

A Project for the ZHAW school

## Framework
Simple ideas need simple code - we now use [meteor](http://www.meteor.com/)!

Code is written in [coffescript](http://coffeescript.org/), 
most written in [Literate coffescript](http://coffeescript.org/#literate), 
so code is commented with markdown. 

## Literate-Story-Programming
We came up with the idea to merge to concept of literate-programming with stories from agile programming.

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



### additional assets
html-files and css files, that belong to a story are named like this:

storyX.html, storyX.css, etc.

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



