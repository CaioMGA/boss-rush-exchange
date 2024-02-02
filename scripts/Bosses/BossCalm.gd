extends "res://scripts/Bosses/Boss.gd"

var position_entrance:Vector2
var entrance_duration:float
var entrance_eta:float
var sprite:Sprite2D

#flags
var entrance_routine_active = false
var is_alive = false

func _ready():
	sprite = $Sprite2D as Sprite2D
	boss_name = "Amelia"
	boss_title = "Calm Gal"
	
	var phase1 = BossPhase.new()
	phase1.life = 1000
	phase1.is_invencible = false
	phase1.duration = 0
	phase1.cancel_bullets_on_phase_end = true
	
	var phase2 = BossPhase.new()
	phase1.life = 800
	phase1.is_invencible = false
	phase1.duration = 0
	phase1.cancel_bullets_on_phase_end = false
	
	var phase3 = BossPhase.new()
	phase1.life = 1000
	phase1.is_invencible = false
	phase1.duration = 0
	phase1.cancel_bullets_on_phase_end = true
	
	var phase4 = BossPhase.new()
	phase1.life = 500
	phase1.is_invencible = false
	phase1.duration = 0
	phase1.cancel_bullets_on_phase_end = true
	
	phases.append(phase1)
	phases.append(phase2)
	phases.append(phase3)
	phases.append(phase4)
	
	prepare_entrance()
	enter()

func prepare_entrance():
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
			entrance_routine_active = false
			is_alive = true
			remove_child(sprite)
			$Path2D/PathFollow2D.add_child(sprite)
		return
	
	if is_alive:
		$Path2D/PathFollow2D.progress_ratio += delta / 10
	


func _on_area_2d_area_entered(area):
	print ("take some damage")