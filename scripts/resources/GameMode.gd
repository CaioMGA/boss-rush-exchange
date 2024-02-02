extends Resource
class_name GameMode

@export var name = "Normal Mode"
@export var hp = 2
@export var lives = 2
@export var continues = 1
@export var has_infinite_continues = false

@export var bosses:Array

#penalties
@export var loses_hyper_on_death = false
@export var score_penalty_on_death = 15000
