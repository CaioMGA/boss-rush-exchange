extends Node

# base class to be extended by bosses individual classes
var phases:Array = []
var boss_name = "Gal Name"
var boss_title = "Something Gal"

signal start_combat

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
