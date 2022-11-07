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
onready var timer = get_node("Time Label")
onready var foo_label = get_node("Stupid Label")
onready var keys = $"%Keys"	
onready var original_speed = player_speed

onready var current_objective = player.position
var path = []
var movement_index = 0

var time_start = 0
var time_now = 0

func _on_key_pressed(pos):
	path = Navigation2DServer.map_get_path(
	get_world_2d().navigation_map,
	player.position,
	pos,
	true
	)
	movement_index = 0
	if(len(path) > 0):
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
	time_start = OS.get_ticks_msec()
	randomize()
	for key in keys.get_children():
		key.connect("key_pressed", self, "_on_key_pressed")
		key.connect("key_stomped", self, "_on_key_stomped")
	anim_tree.active = true
	
	player.connect("player_damaged", self, "_player_damaged")
	
	for _i in range(3):
		spawn_mob()
	

func _process(delta):
	
	time_now = OS.get_ticks_msec()
	var time_elapsed = time_now - time_start
	timer.text = time_to_minutes_secs_mili(time_elapsed)
	
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

func time_to_minutes_secs_mili(time : float):
	time = time / 1000.0
	var mins = int(time) / 60
	time -= mins * 60
	var secs = int(time) 
	var mili = int((time - int(time)) * 100)
	return str("%0*d" % [2, mins]) + ":" + str("%0*d" % [2, secs]) + ":" + str("%0*d" % [2, mili]) 

func _on_key_stomped(key : String):
	foo_label.text += key
