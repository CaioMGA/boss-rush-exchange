extends Node

@export var scene_name:RichTextLabel

func _ready():
	scene_name.text = get_tree().current_scene.name

func _on_back_button_down():
	get_tree().change_scene_to_file("res://scenes/rooms/TitleScreen.tscn")


func _on_next_phase_button_down():
	print("next_phase_button pressed")


func _on_victory_button_down():
	print("victory_button pressed")


func _on_defeat_button_down():
	print("defeat_button pressed")


func _on_next_boss_button_down():
	print("next_boss_button pressed")


func _on_restart_button_down():
	get_tree().reload_current_scene()
