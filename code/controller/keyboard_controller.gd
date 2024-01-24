class_name KeyboardController

func is_crouch():
	return Input.is_action_pressed("crouch")

func move_direction():
	return Vector3(
		Input.get_axis("right", "left"),
		0,
		Input.get_axis("down", "up"))
