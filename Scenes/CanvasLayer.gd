extends CanvasLayer

onready var maxHp = 6
onready var player = get_node("player")
var heart = preload("res://Scenes/Heart.tscn")

func _ready():
	for i in range(maxHp/2):
		var heartInst = heart.instance()
		add_child(heartInst) 
