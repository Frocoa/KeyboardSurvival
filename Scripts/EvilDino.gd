extends Area2D

onready var player = get_node("../player")
var delay = 3

var movement = []

var is_ready = false

func _ready():
	connect("body_entered", self, "_on_body_entered")
	hide()

func _process(delta):
	
	movement.push_back(player.position)
	
	if movement.size() > (delay * 300 * delta):
		if is_ready == false:
			self.show()
			is_ready = true
		position = movement.pop_front()

func _on_body_entered(body: Node):
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
