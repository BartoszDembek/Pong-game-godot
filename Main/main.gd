extends Node2D


var showPauseMenu

func _ready():
	$Ball.stop_ball()
	$Timer.start()
	Global.gamePaused = false
	Global.playerTwoScore = 0
	Global.playerOneScore = 0

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseGame()


func pauseGame():
	Global.gamePaused = !Global.gamePaused
	$PauseMenu.visible = Global.gamePaused
	get_tree().paused = Global.gamePaused

func _on_reset_area_left_body_entered(_body):
	$Ball.position  = Vector2(640,360)
	Global.playerTwoScore += 1
	$ScoreSound.play()
	reset_players_position()
	if Global.playerTwoScore == 10:
		get_tree().paused = true
	$Ball.stop_ball()
	$Timer.start()	


func _on_reset_area_right_body_entered(_body):
	$Ball.position  = Vector2(640,360)
	Global.playerOneScore += 1
	$ScoreSound.play()	
	reset_players_position()
	if Global.playerOneScore == 10:
		get_tree().paused = true
	$Ball.stop_ball()
	$Timer.start()
	
func reset_players_position():
	$Player.position.y = 360
	$Opponent.position.y = 360

func _on_timer_timeout():
	$Ball.random_velocity()


func _on_pause_menu_reset_game():
	$Ball.stop_ball()
	$Timer.start()
	Global.playerTwoScore = 0
	Global.playerOneScore = 0
	$Score.reset_score()
	$Ball.position  = Vector2(640,360)	
	reset_players_position()
	pauseGame()
