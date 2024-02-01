extends Area2D

signal player_hurt

@export var bullet_scene = preload("res://scenes/bullets/bullet_blue_fast.tscn")
@export var normal_speed = 400
@export var focus_speed = 200
var speed
var screen_size
var is_moving_slow = false;
var life = 3

func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.play("idle")

func _process(delta):
	var velocity = Vector2.ZERO
	
	is_moving_slow = Input.is_action_pressed("focus_shot")
	
	if is_moving_slow:
		speed = focus_speed
	else:
		speed = normal_speed
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1;
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1;
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1;
	if Input.is_action_pressed("move_down"):
		velocity.y += 1;
	
	if velocity.x > 0:
		$AnimatedSprite2D.play("bank_right")
	elif velocity.x < 0:
		$AnimatedSprite2D.play("bank_left")
	else:
		$AnimatedSprite2D.play("idle")
		
	if velocity.length() > 0: # should move
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func hurt():
	print("ouch")
	emit_signal("player_hurt")

func _on_area_entered(area):
	if area.is_in_group("bullets"):
		hurt()
