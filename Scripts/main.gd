extends Node2D

export(int) var player_speed = 30
export(int) var run_speed = 100
export(PackedScene) var mob_scene
onready var player = get_node("player")
onready var anim_tree = player.get_node("AnimationTree")
onready var playback = anim_tree.get("parameters/playback")
onready var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
onready var enemy_dino_spawn = get_node("DinoSpawn")
var enemyDino = preload("res://Scenes/EvilDino.tscn")

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
	
func spawn_mob():
	var mob = mob_scene.instance()
	mob.player = player
	mob_spawn_location.offset = randi()
	mob.rotation  = mob_spawn_location.rotation
	mob.position = mob_spawn_location.position
	mob.linear_velocity = mob.velocity.rotated(mob.rotation)
	add_child(mob) # se agrega al tree y se llama a _ready en mob
	

func _ready():
	randomize()
	for key in keys.get_children():
		key.connect("key_pressed", self, "_on_key_pressed")
	anim_tree.active = true
	
	player.connect("player_damaged", self, "_player_damaged")
	
	for i in range(3):
		spawn_mob()
	

func _process(delta):
	if (current_objective - player.position).length() > 0.8:
		player.position = player.position.move_toward(current_objective, player_speed * delta)
		
	else:
		if len(path) >= movement_index + 2:
			movement_index += 1
			current_objective = path[movement_index]
			if player.position.x - current_objective[0] > 0:
				player.scale.x = -1
			else:
				player.scale.x = 1
		else:
			playback.travel('Idle')
	
func _input(_event):
	if Input.is_key_pressed(KEY_SHIFT):
		player_speed = run_speed
		if len(path) >= movement_index + 2:
			playback.travel('Run')
		else:
			pass
	else:
		player_speed = original_speed
		playback.travel('Walking')
	
	if Input.is_key_pressed(KEY_CONTROL):
		var enemyInst = enemyDino.instance()
		enemyInst.position = enemy_dino_spawn.position
		add_child(enemyInst)

func _player_damaged(_hp):
	playback.travel("Damage")
	
