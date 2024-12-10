extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	set_visible(false)
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"): 
		set_visible(true)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true



func _on_resume_pressed() -> void:
	get_tree().paused = false
	set_visible(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_quit_pressed() -> void:
	get_tree().quit()
