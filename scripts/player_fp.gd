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
	
	# Spowolnienie poruszania się na "skos"
	if input.length() > 0:
		input = input.normalized()
	
	apply_central_force(twist_pivot.basis * input * 1200.0 * delta)
	
	twist_pivot.rotate_y(twist_input)
	pitch_pivot.rotate_x(pitch_input)
	pitch_pivot.rotation.x = clamp(pitch_pivot.rotation.x,  -0.5,  0.5)  ### ograniczenie pionowego obrotu kamery
	twist_input = 0.0
	pitch_input = 0.0
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED :
		twist_input = - event.relative.x * mouse_sensitivity
		pitch_input = - event.relative.y * mouse_sensitivity
