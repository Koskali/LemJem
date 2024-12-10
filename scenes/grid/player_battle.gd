extends Area2D

@onready var ray = $RayCast2D

var curr_pos = [576,576]
var dir_right = Vector2(1,0)
var dir_left = Vector2(-1,0)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_right"):
		ray.target_position = (dir_right * 128)
		ray.force_raycast_update()
		if !ray.is_colliding():
			curr_pos[0] += 128
	
	elif event.is_action_pressed("move_left"):

		ray.target_position = (dir_left * 128)
		ray.force_raycast_update()
		if !ray.is_colliding():
			curr_pos[0] -= 128
			 
	self.position = Vector2(curr_pos[0], curr_pos[1])
	
	######### WEAPONS
	
	if event.is_action_pressed("select_paper"):
		print("PAPER")
		
	if event.is_action_pressed("select_rock"):
		print("ROCK")
		
	if event.is_action_pressed("select_scissors"):
		print("SCISSORS")


func spawn_player_projectile():
	print("player")
