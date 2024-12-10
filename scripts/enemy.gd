extends CharacterBody3D





func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_fp"):
		print("enemy 1 approached")
		$Area3D.queue_free()
