extends Node

var freeze_time_scale = 0.05
var freeze_duration = 1.0

func activate():
	Engine.time_scale = 0
	await get_tree().create_timer(0.1, true, false, true).timeout
	Engine.time_scale = 1.0

