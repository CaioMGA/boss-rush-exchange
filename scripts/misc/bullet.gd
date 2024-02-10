extends Node2D

class_name Bullet

@onready var collisionShape = $CollisionShape2D

@export var speed = 300
@export var animated = false;
@export var grow_at_start = false

var is_slowing_down = false
var slow_down_factor = 1.6
var is_growing = false
var grow_factor = 2.0


func _ready():
	if animated:
		$AnimatedSprite2D.play("default")

func _process(delta):
	if is_slowing_down:
		speed -= delta * slow_down_factor * speed
		modulate.a -= delta * 0.5
		
	position += transform.x * speed * delta
	if is_growing:
		var increment = delta * grow_factor
		scale += Vector2(increment, increment) 
		if scale.x > 1:
			scale = Vector2(1, 1)
			is_growing = false

func grow():
	scale = Vector2(0, 0)
	is_growing = true

func _on_kill_timer_timeout():
	queue_free()
	
func set_kill_timer_wait_time(wait_time):
	if(wait_time <= 0):
		queue_free()
		return
	
	$KillTimer.stop()
	$KillTimer.wait_time = wait_time
	$KillTimer.start()

func disable_collision_and_destroy():
	if collisionShape != null:
		collisionShape.queue_free()
	
	if animated:
		var sprt = $AnimatedSprite2D
		sprt.self_modulate = sprt.self_modulate.darkened(0.5)
		set_kill_timer_wait_time(2.0)
		return
	
	
	var sprite = $Sprite2D as Sprite2D
	
	sprite.self_modulate = sprite.self_modulate.darkened(0.5)
	set_kill_timer_wait_time(2.0)
	#set_kill_timer_wait_time(0.4)

func slow_down():
	is_slowing_down = true
