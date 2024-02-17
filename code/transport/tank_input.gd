class_name TankInput

var tank
var move_input
var look_input
var gun_input

func _init(_tank, _move_input, _look_input, _gun_input):
	tank = _tank
	move_input = _move_input
	look_input = _look_input
	gun_input = _gun_input

func engine_l_input() -> float:
	var move_direction = move_local_direction()
	return move_direction.x + move_direction.z

func engine_r_input() -> float:
	var move_direction = move_local_direction()
	return -move_direction.x + move_direction.z

func look_direction():
	return look_input.look_direction()

func move_local_direction():
	return tank.quaternion.inverse() * move_input.move_direction()
