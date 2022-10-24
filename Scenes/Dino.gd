extends AnimatedSprite

export(int) var dino_offset = 50


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	translate(Vector2(5,0))
	
	if position.x > get_tree().get_root().size.x + dino_offset:
		position.x = position.x - (get_tree().get_root().size.x + (dino_offset * 5))
	

