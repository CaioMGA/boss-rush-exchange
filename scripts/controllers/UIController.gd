extends Node

@export var player_score:RichTextLabel
@export var player_hp:RichTextLabel
@export var player_lives:RichTextLabel
@export var boss_hp:RichTextLabel
@export var boss_phase:RichTextLabel

@export  var health_sys:HealthSystem

func update_ui():
	player_hp.text = "HP: %d" % [health_sys.cur_hp]
	player_lives.text = "Lives: %d" % [health_sys.continues]
