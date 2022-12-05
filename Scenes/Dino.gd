extends AnimatedSprite

export(int) var dino_offset = 50


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(250,0) * delta)
	

