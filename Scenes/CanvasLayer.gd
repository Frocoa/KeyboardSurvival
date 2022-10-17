extends CanvasLayer

onready var maxHp = 6
onready var player = get_parent().get_node("player")
onready var spawn = get_node("HeartSpawn")
var heart = preload("res://Scenes/Heart.tscn")
var containers = []

func _ready():
	player.connect("player_damaged", self, "_player_damaged")
	
	for i in range(maxHp/2):
		var heartInst = heart.instance()
		spawn.add_child(heartInst)
		heartInst.position.x += i * 50 
		containers.append(heartInst)

func _player_damaged(hp):
	var broken_container = containers[(hp-1) /2]
	var animation = "broken idle" if ((hp%2) == 0) else "empty"
	print("###############")
	print ("broken idle" if ((hp%2) == 0) else "empty")
	print(hp)
	print("############")
	broken_container.get_node("AnimatedSprite").animation = animation
