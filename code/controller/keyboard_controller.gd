class_name KeyboardController

var character

func _init(character):
	self.character = character

func is_crouch():
	return Input.is_action_pressed("crouch")

func move_direction():
	return Vector3(
		Input.get_axis("right", "left"),
		0,
		Input.get_axis("down", "up"))
