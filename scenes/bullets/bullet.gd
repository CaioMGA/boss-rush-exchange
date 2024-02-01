extends Node2D

@export var speed = 300
@export var animated = false;


func _ready():
	if animated:
		$AnimatedSprite2D.play("default")

func _process(delta):
	position += transform.x * speed * delta
	
func _on_kill_timer_timeout():
	queue_free()
