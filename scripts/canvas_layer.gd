extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS ### warstwy nie da się zapauzować
	set_visible(false) ### wyłączenie widoczności menu
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):  ### po kliknięciu "esc" 
		set_visible(true) ### widać menu
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)### widać myszkę
		get_tree().paused = true ### pauzowanie wszystkich elemntów do zpauzowania



func _on_resume_pressed() -> void:
	get_tree().paused = false ### odpauzowanie gry
	set_visible(false) ### nie widać menu
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 


func _on_quit_pressed() -> void:
	get_tree().quit()### wyjście z gry
