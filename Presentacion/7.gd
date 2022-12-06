extends Node2D

onready var label = $Label
onready var label_2 = $Label2
onready var keys = $"%Keys"


func _ready():
	label.visible = true
	label_2.visible = false


func _input(event):
	if event.is_action_pressed("continue"):
		label.visible = false
		label_2.visible = true

	if event.is_action_pressed("sig"):
		get_tree().change_scene("res://Presentacion/8.tscn")
	if event.is_action_pressed("antes"):
		get_tree().change_scene("res://Presentacion/6.tscn")
