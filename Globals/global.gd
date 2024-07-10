extends Node

signal scoreChange

var playerOneScore = 0:
	set(value):
		playerOneScore = value
		scoreChange.emit()
		
var playerTwoScore = 0:
	set(value):
		playerTwoScore = value
		scoreChange.emit()
		
var aiOn = false:
	set(value):
		aiOn = value
		
var gamePaused = false:
	set(value):
		gamePaused = value
