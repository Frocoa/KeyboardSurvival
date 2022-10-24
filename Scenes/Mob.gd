extends RigidBody2D


export(float) var speed = 150
export(PackedScene) var bullet_scene
var velocity = Vector2(speed, 0.0)
var _timer = null
var player = null # se setea en main


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false)
	_timer.start()
	
func disparar():
	var bullet = bullet_scene.instance()
	get_parent().add_child(bullet)
	bullet.direction = (player.position - position).normalized()
	bullet.position = position + bullet.direction * 20
	bullet.rotation = bullet.get_angle_to(player.position) - PI/2

func _on_Timer_timeout():
	disparar()
	
func _on_VisibilityNotifier2D_screen_exited():
	self.rotation *= -1
	self.linear_velocity *= -1
