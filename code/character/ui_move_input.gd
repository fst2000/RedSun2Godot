class_name UIMoveInput

var look_input
var joystick

func _init(_look_input, _joystick):
	look_input = _look_input
	joystick = _joystick

func move_direction():
	var joystick_input = joystick.input()
	var move_input = Vector3(joystick_input.x, 0, joystick_input.y)
	var look_quaternion = Transform3D.IDENTITY.looking_at(look_input.look_direction()).basis.get_rotation_quaternion()
	var move_dir = (look_quaternion * move_input).slide(Vector3.UP).normalized()
	return move_dir

func update(_delta):
	pass

func is_crouch():
	return false

func is_crawl():
	return false
