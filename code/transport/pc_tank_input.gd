class_name PCTankInput

var tank
var look_input

func _init(_tank):
	tank = _tank
	look_input = SlideLookInput.new(
			ForwardLookInput.new(tank),
			tank,
			MouseInput.new(tank), 1.0,
			20.0)

func update(_delta):
	look_input.update(_delta)

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

func is_shoot():
	return Input.is_action_pressed("fire")

func close():
	pass
