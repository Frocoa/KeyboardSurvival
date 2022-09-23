extends Area2D

export(int) var speed = 30

#onready var rotation = get_transform().get_rotation()

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: Node):
#	body.is_in_group("enemy")
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()


var direction = Vector2(0, 1)

func _process(delta):
	translate(direction.rotated(rotation) * speed * delta)
