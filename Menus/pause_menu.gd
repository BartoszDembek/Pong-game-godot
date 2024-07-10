extends CanvasLayer

signal resetGame

func _on_quit_button_pressed():
	get_tree().quit()


func _on_reset_button_pressed():
	resetGame.emit()


func _on_btm_button_pressed():
	resetGame.emit()
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
