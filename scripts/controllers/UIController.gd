extends Node

@export var player_score:RichTextLabel
@export var player_hp:RichTextLabel
@export var player_lives:RichTextLabel
@export var boss_hp:RichTextLabel
@export var boss_phase:RichTextLabel

@export var GAMEOVER_screen:Node
@export var VICTORY_screen:Node

@export var health_sys:HealthSystem
@export var boss:Boss
	

func update_player_ui():
	player_hp.text = "HP: %d" % [health_sys.cur_hp]
	player_lives.text = "Lives: %d" % [health_sys.continues]

func update_boss_ui():
	boss_phase.text = "Phase: %d/%d" % [boss.cur_phase + 1, boss.phases.size()]
	
func update_boss_hp_ui():
	boss_hp.text = "Boss: %d/%d" % [boss.cur_hp, boss.cur_hp_max]

func show_GAMEOVER_screen():
	GAMEOVER_screen.visible = true
	
func show_VICTORY_screen():
	VICTORY_screen.visible = true
