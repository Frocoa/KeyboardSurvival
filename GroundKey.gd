extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var anim_player = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_leave")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_body_entered(_body: Node):
	anim_player.play("Press")
	
func _on_body_leave(_body: Node):
	anim_player.play("Release")
