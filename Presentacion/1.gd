extends CanvasLayer

onready var color_rect = $ColorRect
onready var pregunta = $Pregunta
onready var label = $Label

func _ready():
	color_rect.visible = true
	pregunta.visible = true
	label.visible = false

func _input(event):
	if event.is_action_pressed("continue"):
		pregunta.visible = false
		label.visible = true
	
	if event.is_action_pressed("sig"):
		get_tree().change_scene("res://Presentacion/2.tscn")
