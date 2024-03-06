class_name  ClampLookInput

var look_input
var origin
var max_angle

func _init(_look_input, _origin, _max_angle : float):
	look_input = _look_input
	origin = _origin
	max_angle = _max_angle * PI / 180.0

func update(_delta):
	look_input.update(_delta)

func look_direction():
	var look_dir = look_input.look_direction()
	var origin_up = origin.global_basis.y
	var look_dir_slide = look_dir.slide(origin_up).normalized()
	var rotation_axis = look_dir_slide.cross(origin_up)
	var look_dir_angle = look_dir.signed_angle_to(look_dir_slide, rotation_axis)
	look_dir = look_dir_slide.rotated(rotation_axis, clamp(-look_dir_angle, -max_angle, max_angle))
	return look_dir
