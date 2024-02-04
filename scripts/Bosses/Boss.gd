extends Node

class_name Boss
# base class to be extended by bosses individual classes
var phases:Array = []
var boss_name = "Gal Name"
var boss_title = "Something Gal"

@export var hit_flash:ColorRect
var is_hit = false
var hit_animation_time = 0.15

signal start_combat

func _process(delta):
	if is_hit:
		hit_flash.modulate.a -= delta / hit_animation_time
		if hit_flash.modulate.a <- 0:
			is_hit = false
	
func get_life_total():
	pass
	
func get_life_remaining():
	pass

func get_cur_phase ():
	pass

func enter():
	pass
	
func finish_entrance():
	pass

func death():
	pass

func on_hit():
	print("boss got hit")
	hit_flash.modulate.a = 1
	is_hit = true
