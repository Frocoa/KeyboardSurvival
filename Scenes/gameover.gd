extends CanvasLayer

onready var restart = $VBox/HBoxContainer/Restart
onready var menu = $VBox/HBoxContainer/Menu
onready var exit = $VBox/HBoxContainer/Exit
onready var player = $".."
onready var canvas_layer = $"../../CanvasLayer"
onready var level_select = $VBox/Select


func _ready():
	restart.connect("pressed",self,"_on_restart_pressed")
	menu.connect("pressed",self,"_on_menu_pressed")
	exit.connect("pressed",self,"_on_exit_pressed")
	level_select.connect("pressed", self, "_on_level_select")
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

func _on_level_select():
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")
	get_tree().paused = false
