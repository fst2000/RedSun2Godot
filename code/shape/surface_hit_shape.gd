class_name SurfaceHitShape
extends HitShape

@export var bullet_hit_particles_prefab : PackedScene

func bullet_hit_action(bullet):
	var hit_point = bullet.ray.get_collision_point()
	var hit_normal = bullet.ray.get_collision_normal()
	var hit_particles = bullet_hit_particles_prefab.instantiate()
	add_child(hit_particles)
	hit_particles.global_position = hit_point
	hit_particles.quaternion = Quaternion(Vector3(0,0,1), hit_normal)
