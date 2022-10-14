extends KinematicBody2D

onready var maxHp = 6
onready var hp = maxHp

signal player_damaged()

func take_damage():
	emit_signal("player_damaged")
	hp -= 1
	if hp == 0:
		on_death()

func on_death():
	get_tree().change_scene("res://Scenes/main_menu.tscn")
