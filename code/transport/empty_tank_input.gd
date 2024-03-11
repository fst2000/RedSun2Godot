class_name EmptyTankInput

var tank

func _init(_tank):
	tank = _tank

func update(_delta):
	pass

func close():
	pass

func look_direction():
	return tank.gun.global_basis.z

func engine_l_input():
	return 0.0

func engine_r_input():
	return 0.0

func is_shoot():
	return false
