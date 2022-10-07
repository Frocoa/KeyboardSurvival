extends Node2D

export(int) var player_speed = 30
export(int) var run_speed = 100
onready var player = get_node("player")
var directions = {
	"up": Vector2.UP,
	"down": Vector2.DOWN,
	"left": Vector2.LEFT,
	"right": Vector2.RIGHT
}

onready var keys = $"%Keys"	
onready var original_speed = player_speed

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
	current_objective = path[movement_index]

func _ready():
	for key in keys.get_children():
		key.connect("key_pressed", self, "_on_key_pressed")

func _process(delta):
	if (current_objective - player.position).length() > 0.8:
		player.position = player.position.move_toward(current_objective, player_speed * delta)
		player.get_node("AnimationPlayer").play('Walking')
	else:
		if len(path) >= movement_index + 2:
			movement_index += 1
			current_objective = path[movement_index]
		else:
			player.get_node("AnimationPlayer").play("RESET")
	
func _input(_event):
	if Input.is_key_pressed(KEY_SHIFT):
		player_speed = run_speed
	else:
		player_speed = original_speed 
