extends "../../Scripts/main.gd"
export(PackedScene) var mob_scene1
var current_frame = 0
var delta_frame = 5

func spawn_mob():
	var mob = mob_scene1.instance()
	mob.player = player
	mob_spawn_location.offset = randi()
	mob.rotation  = mob_spawn_location.rotation
	mob.position = mob_spawn_location.position
	mob.linear_velocity = mob.velocity.rotated(mob.rotation)
	add_child(mob) # se agrega al tree y se llama a _ready en mob

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
		current_frame = 0
		delta_frame *= 1.25
	current_frame += delta
