class_name Key
extends Node2D

export(String) var key = "A"

signal key_pressed(pos)

onready var anim_player = get_node("AnimationPlayer")

func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_leave")

func _input(event):
	if event.is_action_pressed(key):
		emit_signal("key_pressed", global_position)
		

func _on_body_entered(body: Node):
	anim_player.play("Press")
	
func _on_body_leave(body: Node):
	anim_player.play("Release")
