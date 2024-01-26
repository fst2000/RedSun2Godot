extends Node


@onready var camera = get_tree().current_scene.get_node("Camera")

func _ready():
	print(get_tree().current_scene.name)

func is_crouch():
	return Input.is_action_pressed("crouch")

func move_direction():
	var input = Vector3(
		Input.get_axis("right", "left"),
		0,
		Input.get_axis("down", "up"))
	var input_strength = min(1, input.length())
	var direction = -(camera.quaternion * input)
	direction = direction.slide(Vector3.UP).normalized() * input_strength
	return direction
