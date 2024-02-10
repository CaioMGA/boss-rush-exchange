extends Node

class_name Boss

signal start_combat
signal end_phase
signal hit
signal on_death
signal on_prepare_entrance_done

func prepare_entrance():
	on_prepare_entrance_done.emit()
# base class to be extended by bosses individual classes
@onready var phases = [10]
@onready var sprite_2d = $Sprite2D
@onready var timer:Timer = $Timer
@onready var area_2d = $Sprite2D/Area2D
@export var shooters:Array[EnemyShooter]

var boss_name = "Gal Name"
var boss_title = "Something Gal"

var cur_hp = 0.0
var cur_hp_max = 0.0
var cur_phase = 0


@export var hit_flash:HitFlash

func _ready():
	timer.timeout.connect(_on_invincibility_end)

func enter():
	pass
	
func finish_entrance():
	pass

func death():
	on_death.emit()
	

func on_hit():
	hit.emit()
	hit_flash.flash()
	cur_hp -= 1
	if cur_hp <= 0:
		next_phase()

func next_phase():
	
	cur_phase += 1
	if cur_phase >= phases.size():
		death()
		return
	end_phase.emit()
	start_invincibility()
	cur_hp_max = phases[cur_phase]
	cur_hp = cur_hp_max

func start_invincibility():
	sprite_2d.modulate.a = 0.5
	cease_fire()
	timer.start()

func _on_invincibility_end():
	sprite_2d.modulate.a = 1
	enable_shooting()

func cease_fire():
	for shooter in shooters:
		shooter.cease_fire()
	
func enable_shooting():
	for shooter in shooters:
		shooter.enable_shooting()
