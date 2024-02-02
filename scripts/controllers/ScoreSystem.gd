extends Node

var score = 0.0
var base_points = 1.0 # used for fine tuning

func add_score(multiplier):
	score = score + (base_points * multiplier)

func apply_penalty(points):
	score = score - points
	if score < 0:
		score = 0

func get_score():
	return floor(score)
