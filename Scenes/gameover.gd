extends CanvasLayer

onready var restart = $HBoxContainer/Restart
onready var menu = $HBoxContainer/Menu
onready var exit = $HBoxContainer/Exit
onready var player = $".."
onready var canvas_layer = $"../../CanvasLayer"
onready var button = $Button


func _ready():
	restart.connect("pressed",self,"_on_restart_pressed")
	menu.connect("pressed",self,"_on_menu_pressed")
	exit.connect("pressed",self,"_on_exit_pressed")
	button.connect("pressed", self, "_on_button_pressed")
	player.connect("player_dead", self, "_on_player_dead")
	hide()

func _on_player_dead():
	get_tree().paused = true
	visible = true
	canvas_layer.visible = false

func _on_restart_pressed():
	get_tree().reload_current_scene()
	hide()
	get_tree().paused = false
	
func _on_exit_pressed():
	get_tree().quit()

func _on_menu_pressed():
	get_tree().change_scene("res://Scenes/main_menu.tscn")
	get_tree().paused = false

func _on_button_pressed():
	get_tree().change_scene("res://Scenes/Level2.tscn")
	get_tree().paused = false
