extends Node2D
onready var label_3 = $Label3
onready var label_2 = $Label2
onready var button = $Button


export(int) var player_speed = 30
export(int) var run_speed = 100
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
var time_elapsed = 0

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

func _ready():
	label_2.visible = true
	label_3.visible = false
	keys.visible = true
	button.visible = false
	button.connect("pressed",self,"_on_menu_pressed")
	for key in keys.get_children():
		key.connect("key_pressed", self, "_on_key_pressed")
		key.connect("key_stomped", self, "_on_key_stomped")
	anim_tree.active = true
	
	player.connect("player_damaged", self, "_player_damaged")
	player.connect("player_dead", self, "_on_player_death")
	
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
		
	if _event.is_action_pressed("continue"):
		label_2.visible = false
		label_3.visible = true
		keys.visible = false
		player.visible = false
		button.visible = true

func _on_menu_pressed():
	ConfirmSound.play()
	get_tree().change_scene("res://Scenes/main_menu.tscn")
