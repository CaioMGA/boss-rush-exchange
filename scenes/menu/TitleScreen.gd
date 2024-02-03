extends Control

var pathFollow2D:PathFollow2D
var floatingSpeed = 15

func _ready():
	pathFollow2D = $Path2D/PathFollow2D
	$Path2D/PathFollow2D/Player/AnimatedSprite2D.play("idle")

func _process(delta):
	pathFollow2D.progress += delta * floatingSpeed
