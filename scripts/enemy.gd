extends CharacterBody3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_fp"):
		print("enemy 1 approached")
		get_tree().change_scene_to_file("res://scenes/grid/battle_scene_new.tscn")

func _on_area_3d_body_exited(body: Node3D) -> void:
	$Area3D.queue_free()
