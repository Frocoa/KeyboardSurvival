extends CanvasLayer

onready var color_rect = $ColorRect
onready var mob = $Mob
onready var mob_2 = $Mob2
onready var mob_3 = $Mob3


func _ready():
	color_rect.visible = true
	mob.visible = true
	mob_2.visible = true
	mob_3.visible = false

func _input(event):
	if event.is_action_pressed("continue"):
		mob_3.visible = true
		color_rect.color = Color(1,0,0,1)

	if event.is_action_pressed("sig"):
		get_tree().change_scene("res://Presentacion/4.tscn")
	if event.is_action_pressed("antes"):
		get_tree().change_scene("res://Presentacion/2.tscn")
