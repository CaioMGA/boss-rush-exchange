extends Node2D

@export var bullet_scene = preload("res://scenes/bullets/bullet_pink_round.tscn")
@onready var shoot_timer = $ShootTimer

@export var shooter_timer_wait_time = 0.08
@export var bullet_speed = 300

func _ready():
	shoot_timer.wait_time = shooter_timer_wait_time
	shoot_timer.start()

func _on_shoot_timer_timeout():
		shoot()
		
func shoot():
	#	center shot
	var bullet = bullet_scene.instantiate()
	get_tree().root.add_child(bullet)
	bullet.speed = bullet_speed
	bullet.position = $CenterShot.global_position
	bullet.rotation = $CenterShot.rotation
	
	#	left shot
	bullet = bullet_scene.instantiate()
	get_tree().root.add_child(bullet)
	bullet.speed = bullet_speed
	bullet.position = $LeftShot.global_position
	bullet.rotation = $LeftShot.rotation
	
	#	right shot
	bullet = bullet_scene.instantiate()
	get_tree().root.add_child(bullet)
	bullet.speed = bullet_speed
	bullet.position = $RightShot.global_position
	bullet.rotation = $RightShot.rotation
