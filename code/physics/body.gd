class_name Body

static func get_point_velocity(rigidbody, global_point):
	var force_position = global_point - (rigidbody.global_position + rigidbody.center_of_mass)
	var torque_quaternion = Quaternion.from_euler(rigidbody.angular_velocity)
	return rigidbody.linear_velocity + (torque_quaternion * force_position - force_position) 
