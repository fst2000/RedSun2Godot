class_name Wheel

var transport : RigidBody3D
var wheel
var ray
var wheel_start_position
func _init(transport, wheel, ray):
	self.transport = transport
	self.wheel = wheel
	self.ray = ray
	wheel_start_position = wheel.position

func update(delta):
	if ray.is_colliding():
		var point = ray.get_collision_point()
		var normal = ray.get_collision_normal()
		var force_position = point - transport.global_position
		var force_scale = transport.mass * 0.01
		transport.add_constant_force(normal * force_scale, force_position)
