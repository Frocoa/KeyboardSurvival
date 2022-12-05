extends "../../Scripts/main.gd"
export(PackedScene) var mob_scene2
var current_frame = 0
var delta_frame = 5

func spawn_mob(offset):
	var mob = mob_scene2.instance()
	mob.rotate_speed = 50
	mob.shooter_time_wait_time = 0.4
	mob.spawn_point_count = 3
	mob.player = player
	mob_spawn_location.offset = offset
	mob.position = mob_spawn_location.position
	add_child(mob) # se agrega al tree y se llama a _ready en mob

# Called when the node enters the scene tree for the first time.
func _ready():
	MenuTheme.stop()
	LevelTheme.play()
	for offset in [0, 440, 660, 1090]: # numeros al ojimetro
		spawn_mob(offset)

func _process(delta):
	if LevelTheme.playing == false:
		LevelTheme.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
