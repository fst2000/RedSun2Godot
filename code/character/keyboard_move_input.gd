class_name KeyboardMoveInput

var look_input

func _init(_look_input):
	look_input = _look_input

func is_crouch():
	return Input.is_action_pressed("crouch")

func is_crawl():
	return Input.is_action_pressed("crawl")

func move_direction():
	var input = move_input()
	var input_strength = min(1, input.length())
	var look_quaternion = Transform3D.IDENTITY.looking_at(-look_input.look_direction(), Vector3.UP).basis.get_rotation_quaternion()
	var direction = look_quaternion * input
	direction = direction.slide(Vector3.UP).normalized() * input_strength
	return direction

func move_input():
	var input = Vector3(
		Input.get_axis("right", "left"),
		0,
		Input.get_axis("down", "up"))
	var input_length = min(input.length(), 1.0)
	input = input.normalized() * input_length
	return input
