extends Node3D

var velocity

func _ready():
	scale.z = 0.1

func _physics_process(delta):
	look_at(global_position - velocity)
	global_position += velocity * delta
	if scale.z < 10: scale.z += delta * 30
