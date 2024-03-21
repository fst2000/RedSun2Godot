extends Node3D

var velocity
var damage
var impulse
var gravity = 10
var life_time
var delete_timer = 0.0
var prev_global_pos
var has_hit = false

@onready var raycast = $RayCast3D

func initialize(fire_point : Node3D, _damage : float, _impulse : float, speed : float, _life_time : float):
		damage = _damage
		impulse = _impulse
		life_time = _life_time
		global_position = fire_point.global_position
		prev_global_pos = global_position
		velocity = fire_point.global_basis.z * speed
		look_at(global_position - velocity)
		velocity *= clamp(0.5 + RandomNumberGenerator.new().randf(), 0.8, 1.2)

func hit_action(object):
	object.bullet_hit_action(self)

func _ready():
	scale.z = 0.05

func _physics_process(delta):
	if delete_timer > life_time:
		queue_free()
	else:
		delete_timer += delta
		velocity.y -= gravity * delta
		look_at(global_position - velocity)
		prev_global_pos = global_position
		global_position += velocity * delta
		scale.z = min(scale.z + delta * velocity.length() * 0.2, velocity.length() * 0.03)
	var ray = PhysicsRayQueryParameters3D.create(prev_global_pos, global_position, raycast.collision_mask)
	var collision := get_world_3d().direct_space_state.intersect_ray(ray)
	if collision:
		if !has_hit:
			var hit_collider = collision.get("collider")
			if hit_collider.has_method("bullet_hit_action"):
				hit_collider.bullet_hit_action(self, collision.get("position"), collision.get("normal"))
			has_hit = true
	else:
		has_hit = false
