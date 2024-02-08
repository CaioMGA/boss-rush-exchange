extends Node

var stage_loop = []
var loop_track_index = -1
var audio_stream_player:AudioStreamPlayer

func _ready():
	audio_stream_player = $AudioStreamPlayer
	audio_stream_player.stream = load("res://audio/music/gameplay_intro.ogg")
	stage_loop.append(preload("res://audio/music/gameplay_a.ogg"))
	stage_loop.append(preload("res://audio/music/gameplay_b.ogg"))
	
	audio_stream_player.play()
	
func _on_audio_stream_finish():
	play_loop()

func play_loop():
	loop_track_index += 1
	if loop_track_index >= stage_loop.size():
		loop_track_index = 0
	
	audio_stream_player.stream = stage_loop[loop_track_index]
	audio_stream_player.play()
