# Optimale Lösung finden

Als Problemsteller möchte ich vom System wissen, welche Lösungsvariante am besten abschneidet.

**Priorität:** 9

**Schätzung:** 8

## Akzeptanzkriterien:

**Kriterium "Schnellzugriff auf Probleme des users"**
Situation: User möchte die Lösungen für **seine** gestarteten Probleme sehen
Aktion: User ist auf Homepage
Erwartetes Ergebnis: User sieht liste seiner gestarteten Probleme


**Kriterium "Top Lösung"**
Situation: User möchte sofort sehen, welche Lösung zu seinem Problem am besten abgeschnitten hat
Aktion: User klickt auf ein Problem
Erwartetes Ergebnis: Lösung mit höchstem Score ist zuoberst.

## assets
- [story9.html](story9.html)

## Client

	if Meteor.isClient
	
## Task

let user that created problems see all problems that he started ("my problems")
create a new section on the front page for that

	Template.myProblems.problems = ->
		Problems.find(userID:Meteor.userId())


## Task

~~sort by rating score of the solutions so that top solution is on top of the list~~
-> added in story2

## Task

~~Highlight the top solution with a appropriate color or similar~~
-> added in story2


