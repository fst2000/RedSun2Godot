extends Node3D

var aim_system
var camera
var weapon_func

@export_flags_3d_physics var collision_layers

func initialize(_aim_system, _camera, _weapon_func : Callable):
	camera = _camera
	weapon_func = _weapon_func
	aim_system = _aim_system
	visible = false

@onready var view_sight = $ViewSight
@onready var weapon_sight = $WeaponSIght

func aim(_direction):
	aim_system.aim(_direction)
	if !visible: set_visible(true)
	view_sight.global_position = camera.global_position + _direction
	var weapon = weapon_func.call()
	var fire_point = weapon.fire_point.global_position
	var ray_distance = 200
	var ray = PhysicsRayQueryParameters3D.create(fire_point, fire_point + weapon.global_basis.z * ray_distance, collision_layers)
	var collision := get_world_3d().direct_space_state.intersect_ray(ray)
	var intersects = collision.size() > 0
	if intersects:
		print("intersects")
		weapon_sight.global_position = collision.get("position")
	else:
		weapon_sight.global_position = view_sight.global_position

func reset():
	aim_system.reset()
	set_visible(false)
