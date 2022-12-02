extends MarginContainer

onready var level1 = $VBoxContainer/Level1
onready var level2 = $VBoxContainer/Level2
onready var level3 = $VBoxContainer/Level3
onready var level4 = $VBoxContainer/Level4

func _ready():
	level1.connect("pressed", self, "_on_level1_pressed")
	level2.connect("pressed", self, "_on_level2_pressed")	
	level3.connect("pressed", self, "_on_level3_pressed")
	level4.connect("pressed", self, "_on_level4_pressed")

func _on_level1_pressed():
	ConfirmSound.play()
	get_tree().change_scene("res://Scenes/Level1.tscn")
	Global.current_level = "1"
	
func _on_level2_pressed():
	ConfirmSound.play()
	get_tree().change_scene("res://Scenes/Level2.tscn")
	Global.current_level = "2"
	
func _on_level3_pressed():
	ConfirmSound.play()
	get_tree().change_scene("res://Scenes/Level3.tscn")
	Global.current_level = "3"
	
func _on_level4_pressed():
	ConfirmSound.play()
	get_tree().change_scene("res://Scenes/Level4.tscn")
	Global.current_level = "4"
