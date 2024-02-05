extends Node2D

class_name Bullet
@export var speed = 300
@export var animated = false;
var is_slowing_down = false
var slow_down_factor = 1.6

@onready var collisionShape = $CollisionShape2D

func _ready():
	if animated:
		$AnimatedSprite2D.play("default")

func _process(delta):
	if is_slowing_down:
		speed -= delta * slow_down_factor * speed
		modulate.a -= delta * 0.5
		
	position += transform.x * speed * delta
	
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
