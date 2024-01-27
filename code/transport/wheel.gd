class_name Wheel

var transport : RigidBody3D
var wheel
var ray : RayCast3D
var damping_scale
var wheel_start_position
var wheel_radius
func _init(transport, wheel, ray, damping_scale):
	self.transport = transport
	self.wheel = wheel
	self.ray = ray
	self.damping_scale = damping_scale
	wheel_start_position = wheel.position
	wheel_radius = ray.target_position.length()

func update(delta):
	damping(delta)

func damping(delta):
	if ray.is_colliding() && ray.get_collider() != transport:
		var point = ray.get_collision_point()
		var normal = ray.get_collision_normal()
		var force_position = point - transport.global_position
		var torque_quaternion = Quaternion.from_euler(transport.angular_velocity)
		var velocity_at_point = transport.linear_velocity + (torque_quaternion * force_position - force_position) 
		var velocity_normal_dot = normal.dot(velocity_at_point)
		var dot_force = max(-velocity_normal_dot, 0) + 0.5
		var wheel_global_position = transport.global_position + transport.quaternion * wheel_start_position
		var wheel_damp = (wheel_radius - (wheel_global_position - point).length()) / wheel_radius
		var force_scale = transport.mass * dot_force * damping_scale * wheel_damp
		var damping_force = normal * force_scale
		transport.apply_force(damping_force, force_position)
		
		var wheel_offset = transport.basis.y * wheel_damp * wheel_radius
		var wheel_offset_dot = wheel_offset.dot(transport.basis.y)
		if wheel_offset_dot > 0:
			wheel.global_position = wheel_global_position + wheel_offset
		else:
			wheel.global_position = wheel_global_position
		ray.global_position = wheel_global_position
