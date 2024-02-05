extends ColorRect

class_name HitFlash
var is_hit = false
var hit_animation_time = 0.15

func flash():
	modulate.a = 1
	is_hit = true

func _process(delta):
	if is_hit:
		modulate.a -= delta / hit_animation_time
		if modulate.a <- 0:
			is_hit = false
