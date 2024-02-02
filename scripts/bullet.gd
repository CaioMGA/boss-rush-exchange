extends Node2D

class_name Bullet
@export var speed = 300
@export var animated = false;


func _ready():
	if animated:
		$AnimatedSprite2D.play("default")

func _process(delta):
	position += transform.x * speed * delta
	
func _on_kill_timer_timeout():
	queue_free()
	
func set_kill_timer_wait_time(wait_time):
	$KillTimer.wait_time = wait_time
	$KillTimer.start()
	
