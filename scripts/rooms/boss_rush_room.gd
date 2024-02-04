extends Node2D
@onready var game_controller = $GameController as GameController
@export var boss_spawn_point:Node2D
var boss:Boss;
var cur_boss_index = 0

const boss_list = [
	"res://scenes/enemies/bosses/boss-calm.tscn",
	"res://scenes/enemies/bosses/boss-nerdy.tscn"]

func _ready():
	load_next_boss()

func load_next_boss():
	destroy_boss()
	
	var boss_loaded = load(boss_list[cur_boss_index])
	var boss_instance = boss_loaded.instantiate()
	boss_instance.global_position = boss_spawn_point.global_position
	add_child(boss_instance)
	boss = boss_instance as Boss
	cur_boss_index += 1
	
	if cur_boss_index >= boss_list.size():
		cur_boss_index = 0

func destroy_boss():
	# do proper animations and what-nots
	# then destroy it
	if boss != null:
		boss.queue_free()
	
	game_controller.enemy_bullet_clear()
	game_controller.player_bullet_clear()
