extends CanvasLayer

onready var color_rect = $ColorRect
onready var charles_2 = $Charles2
onready var dino = $Dino


func _ready():
	dino.visible = true
	charles_2.visible = true
	
func _input(event):
	if event.is_action_pressed("sig"):
		get_tree().change_scene("res://Presentacion/6.tscn")
	if event.is_action_pressed("antes"):
		get_tree().change_scene("res://Presentacion/4.tscn")
