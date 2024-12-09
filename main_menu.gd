extends Control


## Kliknięcie przycisku start
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	##main menu zmienić na scenę z grą
##Kliknięcie przycisku Credits

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	##main menu zmienić na scenę z creditsami

##Kliknięcie przycisku Quit

func _on_quit_pressed() -> void:
	get_tree().quit()
