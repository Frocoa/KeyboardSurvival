extends Node2D

onready var restart = $HBoxContainer/Restart
onready var menu = $HBoxContainer/Menu
onready var exit = $HBoxContainer/Exit


func _ready():
	restart.connect("pressed",self,"_on_restart_pressed")
	menu.connect("pressed",self,"_on_menu_pressed")
	exit.connect("pressed",self,"_on_exit_pressed")


	
func _on_restart_pressed():
	get_tree().change_scene("res://Scenes/main.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
	
func _on_menu_pressed():
	get_tree().change_scene("res://Scenes/main_menu.tscn")
