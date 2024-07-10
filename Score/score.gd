extends CanvasLayer


@onready var playerOneScoreLabel: Label = $Control/HBoxContainer/PlayerOneScore
@onready var playerTwoScoreLabel: Label = $Control/HBoxContainer/PlayerTwoScore
var white = Color("#ffffff")
var red = Color("#cb4a00")

func _ready():
	Global.connect("scoreChange",update_score)
	update_score()

func update_score():
	playerOneScoreLabel.text = str(Global.playerOneScore)
	playerTwoScoreLabel.text = str(Global.playerTwoScore)	
	if Global.playerOneScore >= 10:
		playerOneScoreLabel.modulate = red
		var text = "Player Win" if Global.aiOn == true else "Player One Win"
		display_winner_text(text)
	
	if Global.playerTwoScore >= 10:
		playerTwoScoreLabel.modulate = red
		var text = "Computer Win" if Global.aiOn == true else "Player Two Win"
		display_winner_text(text)

func reset_score():
	playerOneScoreLabel.modulate = white
	playerTwoScoreLabel.modulate = white
	display_winner_text("")

func display_winner_text(text):
	$Control/MarginContainer/Label.text = text
