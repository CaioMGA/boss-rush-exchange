extends Control
@export var menu_difficulty_select:Node
@export var menu_stage_select:Node
@export var menu_credits:Node
@export var menu_about:Node

var pathFollow2D:PathFollow2D
var floatingSpeed = 15
var selected_game_mode = ""

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
