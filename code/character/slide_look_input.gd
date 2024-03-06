class_name SlideLookInput

var character
var slide_input
var slide_speed
var look_dir : Vector3

func _init(_character, _slide_input, _slide_speed):
	character = _character
	slide_input = _slide_input
	slide_speed = _slide_speed
	look_dir = character.global_basis.z
	

func update(_delta):
	slide_input.update(_delta)
	var slide_velocity = slide_input.velocity()
	look_dir = look_dir.rotated(character.global_basis.y, -slide_velocity.x * _delta * slide_speed)
	look_dir = look_dir.rotated(character.global_basis.y.cross(look_dir).normalized(), slide_velocity.y * _delta * slide_speed)

func look_direction():
	return look_dir
