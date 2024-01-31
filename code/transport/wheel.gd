class_name Wheel

var transport : RigidBody3D
var wheel
var ray : RayCast3D
var damping_scale
var wheel_side_friction
var wheel_axes : Node3D
var wheel_start_position
var wheel_radius
func _init(_transport, _wheel, _ray, _damping_scale, _wheel_side_friction):
	transport = _transport
	wheel = _wheel
	ray = _ray
	damping_scale = _damping_scale
	wheel_side_friction = _wheel_side_friction
	wheel_axes = wheel.get_node("axes")
	wheel_start_position = wheel.position
	wheel_radius = ray.target_position.length()

func update(delta):
	if ray.is_colliding() && ray.get_collider() != transport:
		damp(delta)
		side_friction(delta)

func damp(delta):
	var point = ray.get_collision_point()
	var normal = ray.get_collision_normal()
	var force_position = point - transport.global_position
	var velocity_at_point = Body.get_point_velocity(transport, point)
	var velocity_normal_dot = normal.dot(velocity_at_point)
	var dot_force = max(-velocity_normal_dot, 0) + 0.5
	var wheel_global_position = transport.global_position + transport.quaternion * wheel_start_position
	var wheel_damp = (wheel_radius - (wheel_global_position - point).length()) / wheel_radius
	var force_scale = transport.mass * dot_force * damping_scale * wheel_damp
	var damping_force = normal * force_scale
	transport.apply_force(damping_force * delta * 50, force_position)
	
	var wheel_offset = transport.basis.y * wheel_damp * wheel_radius
	var wheel_offset_dot = wheel_offset.dot(transport.basis.y)
	if wheel_offset_dot > 0:
		wheel.global_position = wheel_global_position + wheel_offset
	else:
		wheel.global_position = wheel_global_position
	ray.global_position = wheel_global_position

func side_friction(delta):
	var point = ray.get_collision_point()
	var point_velocity = Body.get_point_velocity(transport, point)
	var side_direction = wheel_axes.global_basis.x
	var friction_vector = -side_direction * side_direction.dot(point_velocity)
	var friction_force = transport.mass * wheel_side_friction * delta * 50
	var force_position = point - transport.global_position
	transport.apply_force(friction_vector * friction_force, force_position)
