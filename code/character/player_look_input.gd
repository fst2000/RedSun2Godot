class_name SlideLookInput

var character
var slide_input
var max_angle : float
var look_dir : Vector3

func _init(_character, _slide_input, _max_angle : float):
	character = _character
	slide_input = _slide_input
	max_angle = _max_angle * PI / 180.0
	look_dir = character.global_basis.z
	

func update(_delta):
	slide_input.update(_delta)
	var slide_velocity = slide_input.velocity()
	look_dir = look_dir.rotated(character.global_basis.y, -slide_velocity.x * _delta)
	look_dir = look_dir.rotated(character.global_basis.y.cross(look_dir).normalized(), slide_velocity.y * _delta)
	var character_up = character.global_basis.y
	var look_dir_slide = look_dir.slide(character_up).normalized()
	var rotation_axis = look_dir_slide.cross(character_up)
	var look_dir_angle = look_dir.signed_angle_to(look_dir_slide, rotation_axis)
	look_dir = look_dir_slide.rotated(rotation_axis, clamp(-look_dir_angle, -max_angle, max_angle))

func look_direction():
	return look_dir
