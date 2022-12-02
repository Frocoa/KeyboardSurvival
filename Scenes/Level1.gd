extends "../Scripts/main.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

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
	MenuTheme.stop()
	LevelTheme.play()
	for _i in range(3):
		spawn_mob()

func _process(delta):
	if LevelTheme.playing == false:
		LevelTheme.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
