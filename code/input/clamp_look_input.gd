class_name  ClampLookInput

var look_input
var origin
var max_angle

func _init(_look_input, _origin, _max_angle):
	look_input = _look_input
	origin = _origin
	max_angle = _max_angle * PI / 180.0

func look_direction():
	var direction = look_input.look_direction()
	var slided_direction = direction.slide(origin.basis.y).normalized()
	var tilt_quaternion = Quaternion(slided_direction, direction)
	var clamped_direction = slided_direction.rotated(tilt_quaternion.get_axis().normalized(), clamp(tilt_quaternion.get_angle(), -max_angle, max_angle))
	return clamped_direction
