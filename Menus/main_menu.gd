extends Control


func _on_quit_game_button_pressed():
	get_tree().quit()


func _on_pvp_button_pressed():
	Global.aiOn = false
	get_tree().change_scene_to_file("res://Main/main.tscn")


func _on_pvc_button_pressed():
	Global.aiOn = true
	get_tree().change_scene_to_file("res://Main/main.tscn")
