extends Area2D

onready var player = get_node("../player")
const WAIT_FRAMES = 300

var movement = []

var is_ready = false

func _ready():
	connect("body_entered", self, "_on_body_entered")
	hide()

func _process(delta):
	
	movement.push_back(player.position)
	
	if movement.size() > WAIT_FRAMES:
		if is_ready == false:
			show()
			is_ready = true
		position = movement.pop_front()

func _on_body_entered(body: Node):
#	body.is_in_group("enemy")
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
