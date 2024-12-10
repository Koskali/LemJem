extends RichTextLabel

var mask_count = 0
var count

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	OS.delay_msec(100)
	self.text =""
	var mask_icon = Texture.new()
	mask_icon = load("res://assets/2d/próbny_kawałek_maski.jpeg")
	add_image(mask_icon,40,40)
	count = (" : " + str(mask_count))
	add_text(count)
	mask_count += 1
