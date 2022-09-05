extends Node2D

var tile_size = 32
onready var player = get_node("player")
onready var tilemap = get_node("tileMap")
var directions = {
	"up": Vector2.UP,
	"down": Vector2.DOWN,
	"left": Vector2.LEFT,
	"right": Vector2.RIGHT
}



onready var keys = $"%Keys"	

func _on_key_pressed(pos):
	player.global_position = pos

func _ready():
	for key in keys.get_children():
		key.connect("key_pressed", self, "_on_key_pressed")
	
	Navigation2DServer.map_force_update(get_world_2d().navigation_map)
		
	var path2 = Navigation2DServer.map_get_path(
	get_world_2d().navigation_map,
	keys.get_children()[0].global_position,
	keys.get_children()[0].global_position + Vector2.RIGHT*5,
	true
	)
	
	print(keys.get_children()[0].global_position)
	print(keys.get_children()[1].global_position)
	print(path2)	
func getGridPosition(coordinate):
	return tilemap.world_to_map(tilemap.to_local(coordinate))

func getTileId(gridPos):
	return tilemap.get_cellv(gridPos)

func _process(delta):
	
	# esto es para mover el mono libremente y debugear
	if Input.is_action_just_pressed("up"):
		player.position += Vector2.UP * tile_size
	if Input.is_action_just_pressed("down"):
		player.position += Vector2.DOWN * tile_size
	if Input.is_action_just_pressed("left"):
		player.position += Vector2.LEFT * tile_size
	if Input.is_action_just_pressed("right"):
		player.position += Vector2.RIGHT * tile_size
		
	var tileIds = tilemap.getIds()
	var playerGridPos = getGridPosition(player.position)
	var adjacentTileIds = {
		"up": getTileId(playerGridPos - Vector2.UP),
		"down": getTileId(playerGridPos - Vector2.DOWN),
		"left": getTileId(playerGridPos - Vector2.LEFT),
		"right": getTileId(playerGridPos - Vector2.RIGHT)
	}
	
#	for dir in adjacentTileIds:
#		var key = tilemap.findTileKeyById(adjacentTileIds[dir])
#		if key != "NOTFOUND" and Input.is_action_just_pressed(key):
#			player.position -= directions[dir] * tile_size
#			break	
