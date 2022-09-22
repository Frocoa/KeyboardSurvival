extends Node2D

var tile_size = 32
export(int) var player_speed = 30
onready var player = get_node("player")
var directions = {
	"up": Vector2.UP,
	"down": Vector2.DOWN,
	"left": Vector2.LEFT,
	"right": Vector2.RIGHT
}



onready var keys = $"%Keys"	

onready var current_objective = player.position
var path = []
var movement_index = 0

func _on_key_pressed(pos):
	path = Navigation2DServer.map_get_path(
	get_world_2d().navigation_map,
	player.position,
	pos,
	true
	)
	movement_index = 0

func _ready():
	for key in keys.get_children():
		key.connect("key_pressed", self, "_on_key_pressed")

func _process(delta):
	if (current_objective - player.position).length() > 0.8:
		player.position += (
			(current_objective - player.position).normalized() 
			* delta * player_speed)
	else:
		if len(path) >= movement_index + 2:
			movement_index += 1
			current_objective = path[movement_index]
	
