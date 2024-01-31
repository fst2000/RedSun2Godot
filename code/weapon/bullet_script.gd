extends Node3D

var velocity
var gravity = 10

func _ready():
	scale.z = 0.05

func _physics_process(delta):
	velocity.y -= gravity * delta
	look_at(global_position - velocity)
	global_position += velocity * delta
	if scale.z < 10: scale.z += delta * 30
