extends Node2D
@onready var game_controller = $GameController as GameController
@onready var health_sys = $"GameController/Health System" as HealthSystem
@onready var ui_controller = $"GameController/UI Controller"
@export var boss_spawn_point:Node2D
var boss:Boss
var cur_boss_index = 0

var GAMEOVER_state = false

const boss_list = [
		"res://scenes/enemies/bosses/boss-calm.tscn",
		"res://scenes/enemies/bosses/boss-nerdy.tscn",
		]

func _ready():
	var cur_boss_index = 0
	load_next_boss()

func load_next_boss():
	if GAMEOVER_state:
		return
	if cur_boss_index >= boss_list.size():
		ui_controller.show_VICTORY_screen()
		GAMEOVER_state = true
		destroy_boss()
		return
		
	destroy_boss()
	var boss_loaded = load(boss_list[cur_boss_index])
	var boss_instance = boss_loaded.instantiate()
	boss_instance.global_position = boss_spawn_point.global_position
	#add_child(boss_instance)
	call_deferred("add_child", boss_instance)
	#set_deferred("add_child", boss_instance)
	boss = boss_instance as Boss
	boss.connect("start_combat", game_controller._on_boss_start_combat)
	boss.end_phase.connect(game_controller.on_boss_phase_change)
	boss.end_phase.connect(ui_controller.update_ui)
	boss.hit.connect(ui_controller.update_ui)
	boss.on_death.connect(load_next_boss)
	boss.on_prepare_entrance_done.connect(ui_controller.update_ui)
	ui_controller.boss = boss
	cur_boss_index += 1


func destroy_boss():
	# do proper animations and what-nots
	# then destroy it
	if boss != null:
		boss.queue_free()
	
	bullet_clear()
	game_controller.cease_fire.emit()

func bullet_clear():
	game_controller.enemy_bullet_clear()
	game_controller.player_bullet_clear()


func restart_level():
	get_tree().reload_current_scene()


func show_title_screen():
	var scene = "res://scenes/rooms/TitleScreen.tscn"
	get_tree().change_scene_to_file(scene)
