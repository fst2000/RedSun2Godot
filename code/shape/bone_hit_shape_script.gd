class_name BoneHitShape
extends PhysicalBone3D

@export var soldier : Node3D
@export var hit_particles_prefab : PackedScene
@export var damage_mul = 1

func bullet_hit_action(bullet, point, normal):
	var character_body = soldier.character_body
	character_body.damage(bullet.damage * damage_mul)
	apply_impulse(bullet.velocity.normalized() * bullet.impulse)
	var hit_particles = hit_particles_prefab.instantiate()
	add_child(hit_particles)
	hit_particles.global_position = point
	hit_particles.look_at(hit_particles.global_position - normal)
