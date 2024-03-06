class_name PCTankInput

var tank
var look_input

func _init(_tank):
	tank = _tank
	look_input = ForwardLookInput.new(tank)

func engine_l_input() -> float:
	var move_dir = move_input()
	return -move_dir.x + move_dir.z

func engine_r_input() -> float:
	var move_dir = move_input()
	return move_dir.x + move_dir.z

func look_direction():
	return look_input.look_direction()

func move_input():
	return Vector3(
		Input.get_axis("right", "left"),
		0,
		Input.get_axis("down", "up"))
