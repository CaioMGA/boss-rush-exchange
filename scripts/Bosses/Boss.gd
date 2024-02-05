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

var boss_name = "Gal Name"
var boss_title = "Something Gal"

var cur_hp = 0.0
var cur_hp_max = 0.0
var cur_phase = 0


@export var hit_flash:HitFlash


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
	end_phase.emit()
	cur_phase += 1
	if cur_phase >= phases.size():
		death()
		return
	
	cur_hp_max = phases[cur_phase]
	cur_hp = cur_hp_max
