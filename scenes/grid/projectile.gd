extends Area2D

var speed: float = -128  # Prędkość w pikselach na sekundę

func _process(delta: float) -> void:
	position.y += speed * delta  # Ruch pocisku do góry


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		area.queue_free()
		Global.enemy_dead = true
		get_tree().change_scene_to_file("res://scenes/level_main.tscn")
