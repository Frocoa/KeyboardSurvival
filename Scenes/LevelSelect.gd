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
	get_tree().change_scene("res://Scenes/Level1.tscn")
	
func _on_level2_pressed():
	get_tree().change_scene("res://Scenes/Level2.tscn")
	
func _on_level3_pressed():
	get_tree().change_scene("res://Scenes/Level3.tscn")
	
func _on_level4_pressed():
	get_tree().change_scene("res://Scenes/Level4.tscn")
