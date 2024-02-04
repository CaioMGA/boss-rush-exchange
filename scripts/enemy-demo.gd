extends Node2D

@export var bullet_scene = preload("res://scenes/bullets/bullet_pink_round.tscn")
@onready var shoot_timer = $ShootTimer
@onready var delay_timer = $DelayTimer
@onready var rotater = $Rotater

@export var rotate_speed = 35
@export var shooter_timer_wait_time = 0.08
@export var shooter_delay_timer_wait_time = 0.0
@export var spawn_point_count = 4
@export var radius = 32
@export var bullet_speed = 50
@export var bullet_scale = 1.0
@export var bullet_lifetime = 10

var waiting_delay = false
var can_shoot = false

func _ready():
	if shooter_delay_timer_wait_time > 0:
		waiting_delay = true
		
	var step = 2 * PI / spawn_point_count

	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
	
	shoot_timer.wait_time = shooter_timer_wait_time
	shoot_timer.stop()
	
	if waiting_delay:
		delay_timer.wait_time = shooter_delay_timer_wait_time
		delay_timer.start()

func _process(delta: float ) -> void:
	if waiting_delay :
		print("waiting")
		return
			
	if can_shoot:
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
			bullet.scale = Vector2(bullet_scale, bullet_scale)
			var bulletScript = bullet as Bullet
			bulletScript.set_kill_timer_wait_time(bullet_lifetime)

func enable_shooting():
	can_shoot = true


func _on_game_controller_enable_shooting():
	enable_shooting()

func _on_delay_shooter_timer_timeout():
	waiting_delay = false


func _on_boss_start_combat():
	enable_shooting()
