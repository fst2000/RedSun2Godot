class_name UIMoveInput

var look_input
var joystick
var buttons_input

func _init(_look_input, _joystick, _buttons_input):
	look_input = _look_input
	joystick = _joystick
	buttons_input = _buttons_input

func move_direction():
	var joystick_input = joystick.input()
	var move_input = Vector3(joystick_input.x, 0, joystick_input.y)
	var look_quaternion = Transform3D.IDENTITY.looking_at(look_input.look_direction()).basis.get_rotation_quaternion()
	var move_dir = (look_quaternion * move_input).slide(Vector3.UP).normalized()
	return move_dir

func update(_delta):
	pass

func is_crouch():
	return buttons_input.is_crouch()

func is_crawl():
	return buttons_input.is_crawl()
