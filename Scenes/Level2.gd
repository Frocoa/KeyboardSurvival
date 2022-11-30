extends "../Scripts/main.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func spawn_mob(offset):
	var mob = mob_scene2.instance()
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
