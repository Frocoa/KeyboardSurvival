extends AnimatedSprite

export(int) var dino_offset = 50

func _process(delta):
	translate(Vector2(250,0) * delta)
	

