extends Area2D

var enemy_pos = [320, 448, 576, 704, 832]

func change_enemy_position():
	if Global.enemy_dead == false:
		position.x = enemy_pos.pick_random()

func spawn_enemy_projectile():
	print("enemy")
