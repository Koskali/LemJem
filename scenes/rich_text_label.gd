extends RichTextLabel

var mask_count = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	self.text =""
	var mask_icon = Texture.new()
	mask_icon = load("res://assets/2d/próbny_kawałek_maski.jpeg")
	add_image(mask_icon,40,40)
	var count = (" : " + str(mask_count))
	add_text(count)
	mask_count += 1
