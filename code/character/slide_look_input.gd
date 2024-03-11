class_name SlideLookInput

var look_input
var origin : Node3D
var slide_input
var slide_speed
var slide_angle_x = 0.0
var slide_angle_y = 0.0
var max_angle

func _init(_look_input, _origin : Node3D, _slide_input, _slide_speed, _max_angle : float):
	look_input = _look_input
	origin = _origin
	slide_input = _slide_input
	slide_speed = _slide_speed
	max_angle = _max_angle * PI / 180.0
	

func update(_delta):
	slide_input.update(_delta)
	var slide_velocity = slide_input.velocity()
	slide_angle_x += -slide_velocity.x * _delta * slide_speed
	slide_angle_y += slide_velocity.y * _delta * slide_speed
	slide_angle_y = clamp(slide_angle_y, -max_angle, max_angle)

func look_direction():
	var look_dir = look_input.look_direction()
	look_dir = look_dir.rotated(origin.global_basis.y, slide_angle_x)
	look_dir = look_dir.rotated(origin.global_basis.y.cross(look_dir).normalized(), slide_angle_y)
	return look_dir
