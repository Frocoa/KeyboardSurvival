class_name Key
extends Node2D

export(String) var key = "A"

signal key_pressed(pos)


func _input(event):
	if event.is_action_pressed(key):
		emit_signal("key_pressed", global_position)
