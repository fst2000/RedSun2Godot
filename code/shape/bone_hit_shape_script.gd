class_name BoneHitShape
extends Node

@export var soldier : Node3D
@export var hit_particles_prefab : PackedScene
@export var damage_mul = 1
var bone = self

func bullet_hit_action(bullet):
	var character_body = soldier.character_body
	character_body.damage(bullet.damage * damage_mul)
	var hit_point = bullet.ray.get_collision_point()
	var hit_normal = bullet.ray.get_collision_normal()
	bone.apply_impulse(bullet.velocity.normalized() * bullet.impulse)
	var hit_particles = hit_particles_prefab.instantiate()
	add_child(hit_particles)
	hit_particles.global_position = hit_point
	hit_particles.look_at(hit_particles.global_position - hit_normal)
