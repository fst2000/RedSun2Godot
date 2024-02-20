extends Node3D

var velocity
var gravity = 10
var life_time
var delete_timer = 0.0

func initialize(fire_point : Node3D, speed : float, _life_time : float):
		life_time = _life_time
		global_position = fire_point.global_position
		velocity = fire_point.global_basis.z * speed
		look_at(global_position - velocity)
		velocity *= clamp(0.5 + RandomNumberGenerator.new().randf(), 0.8, 1.2)
	

func _ready():
	scale.z = 0.05

func _physics_process(delta):
	if delete_timer > life_time:
		queue_free()
	else:
		delete_timer += delta
		velocity.y -= gravity * delta
		look_at(global_position - velocity)
		global_position += velocity * delta
		scale.z = min(scale.z + delta * velocity.length() * 0.2, velocity.length() * 0.03)
