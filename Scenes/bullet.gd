extends Area2D

export(int) var speed = 90

var direction = Vector2(0, 1) # se re setea en mob

#onready var rotation = get_transform().get_rotation()

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: Node):
#	body.is_in_group("enemy")
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()

# se elimina cuando sale de la pantalla
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _process(delta):
	#translate(direction.normalized() * speed * delta)
	position += direction.normalized() * speed * delta
