extends MarginContainer

var scroll_speed = 1

onready var scroll_container = $ScrollContainer
onready var credits_container = $ScrollContainer/CreditsContainer

var scroll_ended = false

var credits = [
	{
		"name": "simple keys",
		"author": "beamedeighth.itch.io"
	},
	{
		"name": "Pizel",
		"author": "copheemoth.itch.io"
	},
	{
		"name": "Mountain Dusk Parallax Background",
		"author": "ansimuz.itch.io"
	},
	{
		"name": "Music Loop Bundle",
		"author": "tallbeard.itch.io"
	},
	{
		"name": "8-bit / 16-bit Sound Effects Pack",
		"author": "jdwasabi.itch.io"
	},
	{
		"name": "JGA GAMES",
		"author": "Joaquín, Geraldyn, Alan",
	},
]

func _ready():
	for credit in credits:
		var h_separator = HSeparator.new()
		var name_label = _create_label(credit.name)
		var author_label = _create_label(credit.author)
		credits_container.add_child(h_separator)
		credits_container.add_child(name_label)
		credits_container.add_child(author_label)
	scroll_container.scroll_vertical = 0
	set_physics_process(false)
	yield(get_tree().create_timer(1), "timeout")
	set_physics_process(true)
	


func _physics_process(delta):
	var last_scroll = scroll_container.scroll_vertical
	scroll_container.scroll_vertical += scroll_speed
	var new_scroll = scroll_container.scroll_vertical
	if last_scroll == new_scroll:
		_to_main_menu()
		

func _create_label(text) -> Label:
	var label = Label.new()
	label.text = text
	label.align = Label.ALIGN_CENTER
	label.autowrap = true
	return label

func _to_main_menu():
	if not scroll_ended:
		scroll_ended = true
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Scenes/main_menu.tscn")
