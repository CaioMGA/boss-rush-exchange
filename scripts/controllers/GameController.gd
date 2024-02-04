extends Node
class_name GameController
# Controls shmup elements and events
signal enable_shooting


func _on_boss_start_combat():
	print("Start Combat")
	emit_signal("enable_shooting")

func enemy_bullet_clear():
	for node in get_tree().get_nodes_in_group("bullets"):
		if node is Bullet:
			node.slow_down()
			node.disable_collision_and_destroy()
		
func player_bullet_clear():
	for node in get_tree().get_nodes_in_group("bullets_player"):
		if node is Bullet:
			node.queue_free()
