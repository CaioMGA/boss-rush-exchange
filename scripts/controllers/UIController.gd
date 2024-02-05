extends Node

@export var player_score:RichTextLabel
@export var player_hp:RichTextLabel
@export var player_lives:RichTextLabel
@export var boss_hp:RichTextLabel
@export var boss_phase:RichTextLabel

@export var health_sys:HealthSystem
@export var boss:Boss
	
func update_ui():
	player_hp.text = "HP: %d" % [health_sys.cur_hp]
	player_lives.text = "Lives: %d" % [health_sys.continues]
	
	boss_hp.text = "Boss: %d/%d" % [boss.cur_hp, boss.cur_hp_max]
	boss_phase.text = "Phase: %d/%d" % [boss.cur_phase + 1, boss.phases.size()]
