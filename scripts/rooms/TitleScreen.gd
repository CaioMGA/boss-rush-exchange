extends Control
@export var menu_difficulty_select:Node
@export var menu_stage_select:Node
@export var menu_credits:Node
@export var menu_about:Node
@export var menu_settings:Node

@export var menu_pregame:Node

var pathFollow2D:PathFollow2D
var floatingSpeed = 15
var selected_game_mode = ""
var selected_difficulty = ""
var selected_stage = 1

func _ready():
	pathFollow2D = $Path2D/PathFollow2D
	$Path2D/PathFollow2D/Player/AnimatedSprite2D.play("idle")

func _process(delta):
	pathFollow2D.progress += delta * floatingSpeed

func _on_btn_boss_rush_button_down():
	selected_game_mode = "BOSS_RUSH"
	menu_difficulty_select.visible = true

func _on_btn_stage_select_button_down():
	selected_game_mode = "STAGE_SELECT"
	menu_stage_select.visible = true

func _on_btn_credits_button_down():
	menu_credits.visible = true

func _on_btn_about_button_down():
	menu_about.visible = true

func _on_btn_stage_button_down(stage_number):
	print(stage_number)
	selected_stage = stage_number
	menu_difficulty_select.visible = true

func _on_btn_normal_mode_button_down():
	selected_difficulty = "NORMAL"
	show_pre_game_confirmation()

func _on_btn_hard_mode_button_down():
	selected_difficulty = "HARD"
	show_pre_game_confirmation()

func show_pre_game_confirmation():
	menu_pregame.setup(selected_game_mode, selected_difficulty, selected_stage)
	menu_pregame.visible = true


func _on_pregame_start_button_down():
	if selected_game_mode == "BOSS_RUSH":
		var scene = "res://scenes/rooms/boss_rush_room.tscn"
		get_tree().change_scene_to_file(scene)
	else:
		var scene = "res://scenes/rooms/single_stage.tscn"
		get_tree().change_scene_to_file(scene)


func _on_btn_settings_button_down():
	menu_settings.show_settings()
