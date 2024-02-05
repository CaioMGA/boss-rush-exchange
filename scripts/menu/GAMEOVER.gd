extends Control

func _on_btn_back_button_down():
	print("Go to title_screen")
	var scene = "res://scenes/rooms/TitleScreen.tscn"
	get_tree().change_scene_to_file(scene)
