extends "../../Scripts/main.gd"
export(PackedScene) var mob_scene1
export(PackedScene) var mob_scene2

var current_frame = 0
var delta_frame = 5
var shadow_delay = 5

func spawn_mob():
	var mob = mob_scene1.instance()
	mob.player = player
	mob_spawn_location.offset = randi()
	mob.rotation  = mob_spawn_location.rotation
	mob.position = mob_spawn_location.position
	mob.linear_velocity = mob.velocity.rotated(mob.rotation)
	add_child(mob) # se agrega al tree y se llama a _ready en mob

func spawn_shadow(delay):
	var enemyInst = enemyDino.instance()
	enemyInst.position = enemy_dino_spawn.position
	enemyInst.delay = delay
	add_child(enemyInst)

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_mob()
	MenuTheme.stop()
	LevelTheme.play()
	

func _process(delta):
	if LevelTheme.playing == false:
		LevelTheme.play()
	
	if current_frame >= delta_frame:
		spawn_mob()
		spawn_shadow(shadow_delay)
		shadow_delay += 1
		current_frame = 0
		delta_frame *= 1.25
		
	current_frame += delta
