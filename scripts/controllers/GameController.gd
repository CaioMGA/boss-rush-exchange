extends Node

# Controls shmup elements and events
signal enable_shooting


func _on_bosscalm_start_combat():
	print("Start Combat")
	emit_signal("enable_shooting")
