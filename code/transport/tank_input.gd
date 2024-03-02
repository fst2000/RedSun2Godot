class_name TankInput

var tank
var move_input
var look_input
var gun_input

func _init(_tank, _character_input, _gun_input):
	tank = _tank
	move_input = _character_input
	look_input = ClampLookInput.new(_character_input, tank, 20)
	gun_input = _gun_input

func engine_l_input() -> float:
	var move_direction = move_input.move_direction()
	return -move_direction.x + move_direction.z

func engine_r_input() -> float:
	var move_direction = move_input.move_direction()
	return move_direction.x + move_direction.z

func look_direction():
	return look_input.look_direction()
