extends RigidBody2D


export(float) var speed = 150
export(PackedScene) var bullet_scene
var velocity = Vector2(speed, 0.0)
var _timer = null
var player = null # se setea en main

var rotate_speed = 100
var shooter_time_wait_time = 0.1
var spawn_point_count = 4
var radius = 20
onready var shoot_timer = $ShootTimer
onready var rotater = $Rotator

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false)
	_timer.start()
	
	var step = 2 * PI / spawn_point_count
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
	shoot_timer.wait_time = shooter_time_wait_time
	shoot_timer.start()
	
	
func _on_VisibilityNotifier2D_screen_exited():
	self.rotation *= -1
	self.linear_velocity *= -1


func _on_ShootTimer_timeout():
	for s in rotater.get_children():
		var bullet = bullet_scene.instance()
		get_parent().add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation - PI/2
		bullet.direction = bullet.direction.rotated(bullet.rotation)
		bullet.speed = 30
		
func _process(delta):
	var new_rotation = rotater.rotation_degrees + rotate_speed * delta
	rotater.rotation_degrees = fmod(new_rotation, 360)
