extends CanvasLayer

onready var color_rect = $ColorRect
onready var charles_2 = $Charles2
onready var background = $Background
onready var dino = $Dino


func _ready():
	background.visible = true

func _input(event):
	if event.is_action_pressed("continue"):
		background.visible = false

	if event.is_action_pressed("sig"):
		get_tree().change_scene("res://Presentacion/5.tscn")
	if event.is_action_pressed("antes"):
		get_tree().change_scene("res://Presentacion/3.tscn")
