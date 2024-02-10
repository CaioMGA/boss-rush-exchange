extends "res://scripts/Bosses/Boss.gd"

var position_entrance:Vector2
var entrance_duration:float
var entrance_eta:float
var sprite:Sprite2D

#flags
var entrance_routine_active = false
var is_alive = false

func _ready():
	phases = [64, 128, 256]	
	#phases = [10, 10, 10, 10]
	cur_phase = 0
	cur_hp_max = phases[cur_phase]
	cur_hp = cur_hp_max
	sprite = $Sprite2D as Sprite2D
	boss_name = "Steph"
	boss_title = "Nergy Gal"
	
	prepare_entrance()
	enter()

func prepare_entrance():
	super.prepare_entrance()
	position_entrance = sprite.global_position
	sprite.global_position.y -= 100
	entrance_duration = 5.0
	entrance_eta = 0.0
	
	
func enter():
	entrance_routine_active = true
	
func _process(delta):
	if entrance_routine_active:
		entrance_eta += delta
		var percent = entrance_eta / entrance_duration
		sprite.global_position.y = move_toward(sprite.global_position.y, position_entrance.y, percent)
		if percent >= 1:
			finish_entrance()
		return
	
	if is_alive:
		$Path2D/PathFollow2D.progress_ratio += delta / 10
	

func finish_entrance():
	entrance_routine_active = false
	is_alive = true
	remove_child(sprite)
	$Path2D/PathFollow2D.add_child(sprite)
	
	start_combat.emit()

func _on_area_2d_area_entered(_area):
	if _area.is_in_group("bullets_player"):
		on_hit()
		_area.queue_free()
		# decrease health


func _on_boss_start_combat():
	pass # Replace with function body.
