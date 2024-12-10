extends RichTextLabel

var mask_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mask_icon = Texture.new()
	mask_icon = load("res://assets/2d/próbny_kawałek_maski.jpeg")
	add_image(mask_icon,40,40)
	add_text("string")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text= (" : " + str(mask_count))
