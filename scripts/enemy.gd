extends CharacterBody3D



func _ready() -> void:
	print("dupa")


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_fp"):
		print("skibidi sigma")
