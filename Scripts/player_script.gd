extends KinematicBody2D

var tile_size = 32

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func read_input():
	pass

	
func _physics_process(delta):
	read_input()
