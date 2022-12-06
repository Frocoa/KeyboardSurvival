extends CanvasLayer

onready var color_rect = $ColorRect
onready var charles_2 = $Charles2
onready var charles = $Charles

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("sig"):
		get_tree().change_scene("res://Presentacion/3.tscn")
	if event.is_action_pressed("antes"):
		get_tree().change_scene("res://Presentacion/1.tscn")
