extends Node

class_name HealthSystem

signal GAMEOVER
signal player_is_hurt
signal player_death
signal must_update_ui

@export var player:Player
@export var continues = 1

var max_hp = 2
var cur_hp = 2

var invincible = false
var invincibility_time = 4.0
var cur_invincibility_time = 0.0

func _ready():
	#player.on_player_hurt.connect(hurt_player)
	#player.on_player_loses_life.connect(kill_player)
	cur_hp = max_hp

func _process(delta):
	if invincible:
		cur_invincibility_time -= delta
		if cur_invincibility_time <= 0:
			invincible = false
			player.play_normal_animation()

func hurt_player():
	if invincible:
		return
	
	HitStop.activate()
	
	
	player_is_hurt.emit()
	cur_hp -= 1
	if cur_hp <= 0:
		kill_player()
	
	must_update_ui.emit()
	set_invincible()
	
func set_invincible():
	cur_invincibility_time = invincibility_time
	invincible = true
	player.play_hurt_animation()
	

func kill_player():
	player_death.emit()
	if continues <= 0:
		GAMEOVER.emit()
	else:
		continues -= 1
		cur_hp = max_hp
		must_update_ui.emit()
