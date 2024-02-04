class_name KeyboardMoveInput

var camera : Node3D

func _init(_camera):
	camera = _camera

func is_crouch():
	return Input.is_action_pressed("crouch")

func is_crawl():
	return Input.is_action_pressed("crawl")

func move_direction():
	var input = Vector3(
		Input.get_axis("right", "left"),
		0,
		Input.get_axis("down", "up"))
	var input_strength = min(1, input.length())
	var direction = -(camera.quaternion * input)
	direction = direction.slide(Vector3.UP).normalized() * input_strength
	return direction
