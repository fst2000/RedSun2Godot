extends Node3D

var velocity
var gravity = 10
var life_time = 2.0
var delete_timer = 0.0
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
		scale.z = min(scale.z + delta * velocity.length() * 0.1, velocity.length() * 0.03)
