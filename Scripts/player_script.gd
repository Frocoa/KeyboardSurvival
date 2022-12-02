extends KinematicBody2D

export(int) var maxHp = 6
onready var hp = maxHp

signal player_damaged(hp)
signal player_dead()

func take_damage():
	HitSound.play()
	emit_signal("player_damaged", hp)
	hp -= 1
	if hp == 0:
		on_death()

func on_death():
	emit_signal("player_dead")
