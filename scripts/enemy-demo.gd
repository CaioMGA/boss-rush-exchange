extends Node2D

@export var bullet_scene = preload("res://scenes/bullets/bullet_pink_round.tscn")
@onready var shoot_timer = $ShootTimer
@onready var rotater = $Rotater

@export var rotate_speed = 35
@export var shooter_timer_wait_time = 0.08
@export var spawn_point_count = 4
@export var radius = 32
@export var bullet_speed = 50

var can_shoot = false

func _ready():
	var step = 2 * PI / spawn_point_count

	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
	
	shoot_timer.wait_time = shooter_timer_wait_time
	shoot_timer.stop()

func _process(delta: float ) -> void:
	if can_shoot:
		print("can shoot")
		if shoot_timer.is_stopped():
			shoot_timer.start()
	var new_rotation = rotater.rotation_degrees + rotate_speed * delta
	rotater.rotation_degrees = fmod(new_rotation, 360)

func _on_shoot_timer_timeout():
		for s in rotater.get_children():
			var bullet = bullet_scene.instantiate()
			get_tree().root.add_child(bullet)
			bullet.position = s.global_position
			bullet.rotation = s.global_rotation
			bullet.speed = bullet_speed

func enable_shooting():
	can_shoot = true


func _on_game_controller_enable_shooting():
	enable_shooting()
