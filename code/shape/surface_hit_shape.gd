class_name SurfaceHitShape
extends Node

@export var bullet_hit_particles_prefab : PackedScene

func bullet_hit_action(_bullet, point, normal):
	var hit_particles = bullet_hit_particles_prefab.instantiate()
	add_child(hit_particles)
	hit_particles.global_position = point
	hit_particles.quaternion = Quaternion(Vector3(0,0,1), normal)
