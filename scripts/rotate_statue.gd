extends Node3D

@export var player : RigidBody3D 
@export var rotation_speed : float = 20.0  # Prędkość obrotu statuy

func _ready():
	player = get_node("Gameplay/Player")

# Funkcja sprawdzająca, czy gracz patrzy na statuetkę
func is_player_looking_at_statue() -> bool:
	var player_direction = player.global_transform.basis.z.normalized()
	var statue_direction = (global_transform.origin - player.global_transform.origin).normalized()
	var dot_product = player_direction.dot(statue_direction)
	
	return dot_product > 0.5

# Funkcja obracająca statuą, jeśli gracz nie patrzy
func _process(delta):
	if not is_player_looking_at_statue():
		var direction_to_player = (player.global_transform.origin - global_transform.origin).normalized()
		
		var target_rotation = Vector3(0, direction_to_player.angle_to(Vector3.FORWARD), 0)
		
		var current_rotation = global_transform.basis.get_euler()
		var new_rotation = current_rotation.linear_interpolate(target_rotation, rotation_speed * delta)
		
		rotation_degrees = new_rotation
