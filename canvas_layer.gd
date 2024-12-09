extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	set_visible(false)

	if Input.is_action_pressed("ui_cancel"): 
		set_visible(true)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
