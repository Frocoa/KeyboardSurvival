extends MarginContainer

onready var level1 = $VBoxContainer/Level1
onready var level2 = $VBoxContainer/Level2
onready var level3 = $VBoxContainer/Level3
onready var level4 = $VBoxContainer/Level4
onready var record_label = get_parent().get_node("Record")


func _ready():
	var levels = [level1, level2, level3, level4]
	for i in len(levels):
		var level = levels[i]
		level.connect("pressed", self, "_on_level_pressed", [i + 1])
		level.connect("mouse_entered", self, "_on_level_enter", [i + 1])
		level.connect("mouse_exited", self, "_on_level_exit")

func _on_level_pressed(level):
	ConfirmSound.play()
	get_tree().change_scene("res://Scenes/Level" + str(level) + ".tscn")
	Global.current_level = str(level)

func _on_level_enter(level):
	var record = time_to_minutes_secs_mili(read_savegame(level))
	record_label.text = "Level " + str(level) + " record: " + str(record) 
	
func _on_level_exit():
	record_label.text = ""

var savegame = File.new() #file
var save_path = "res://savegame.save"

func read_savegame(level):
	savegame.open(save_path, File.READ) #open the file
	var save_data = savegame.get_var() #get the value
	savegame.close() #close the file
	return save_data[str(level)] #return the value

func time_to_minutes_secs_mili(time : float):
	time = time / 1000.0
	var mins = int(time) / 60
	time -= mins * 60
	var secs = int(time) 
	var mili = int((time - int(time)) * 100)
	return str("%0*d" % [2, mins]) + ":" + str("%0*d" % [2, secs]) + ":" + str("%0*d" % [2, mili]) 
