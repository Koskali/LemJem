extends Area2D

var enemy_pos = [320, 448, 576, 704, 832]
var current_index = 2

# Rozwinąłem tą funkcję o linijki 9 do 19
func change_enemy_position():
	if Global.enemy_dead == false:
		var possible_moves = []
		
		# Ruch w lewo, jeśli może
		if current_index > 0:
			possible_moves.append(current_index - 1)
		
		# Ruch w prawo, jeśli może
		if current_index < enemy_pos.size() - 1:
			possible_moves.append(current_index + 1)
		
		current_index = possible_moves.pick_random()
		position.x = enemy_pos[current_index]

func spawn_enemy_projectile():
	print("enemy")
