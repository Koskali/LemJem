extends RigidBody3D


@onready var twist_pivot: Node3D = $TwistPivot  ### punkt wobec ktorego kamera obraca sie poziomo
@onready var pitch_pivot: Node3D = $TwistPivot/PitchPivot ### ^^to samo tylko pionowo


var mouse_sensitivity := 0.001
var twist_input := 0.0
var pitch_input := 0.0


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) ### gdy program sie odpala nie pokazuje nam kursora


func _process(delta):
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left","move_right")
	input.z = Input.get_axis("move_forward","move_back")

	
	apply_central_force(twist_pivot.basis * input * 1200.0 * delta)
	
	if Input.is_action_just_pressed("ui_cancel"): ### po nacisnieciu ESC kursor sie spowrotem pojawia i nie dziala kamera ale zato mozemy wyjsc z gry
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	twist_pivot.rotate_y(twist_input)
	pitch_pivot.rotate_x(pitch_input)
	pitch_pivot.rotation.x = clamp(pitch_pivot.rotation.x,  -0.5,  0.5)  ### ograniczenie pionowego obrotu kamery
	twist_input = 0.0
	pitch_input = 0.0


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED: ### jesli nie widzimy kursora (czyli jestesmy w trybie grania) kamera jest sterowana ruchem myszy
			twist_input = - event.relative.x * mouse_sensitivity
			pitch_input = - event.relative.y * mouse_sensitivity
