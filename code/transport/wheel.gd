class_name Wheel

var transport : RigidBody3D
var wheel
var ray : RayCast3D
var wheel_start_position
var wheel_radius
func _init(transport, wheel, ray):
	self.transport = transport
	self.wheel = wheel
	self.ray = ray
	wheel_start_position = wheel.position
	wheel_radius = ray.target_position.length()

func update(delta):
	if ray.is_colliding():
		var point = ray.get_collision_point()
		var normal = ray.get_collision_normal()
		var force_position = point - transport.global_position
		var torque_quaternion = Quaternion.from_euler(transport.angular_velocity)
		var velocity_at_point = transport.linear_velocity + (torque_quaternion * force_position - force_position) 
		var normal_dot = normal.dot(velocity_at_point)
		var force_scale = transport.mass * -normal_dot * 2
		transport.apply_force(normal * force_scale, force_position)
