extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS ### warstwy nie da się zapauzować
	set_visible(false) ### wyłączenie widoczności menu
	
func _process(delta: float) -> void: ### po kliknięciu "esc", pauza wszystkiego orpócz menu, widać menu i myszkę
	if Input.is_action_pressed("ui_cancel"):  
		get_tree().paused = true 
		set_visible(true) 
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		

func _on_resume_pressed() -> void:### nie widać menu i odpauzowanie gry
	get_tree().paused = false
	set_visible(false) 
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 


func _on_quit_pressed() -> void: ### wyjście z gry

	get_tree().quit() 
