class_name TankCameraController

var camera
var tank
var distance = 4
var height = 4

func _init(_camera, _tank):
	camera = _camera
	tank = _tank

func update(_delta):
	var tank_input = tank.tank_input
	var look_direction = tank_input.look_direction()
	var local_position = look_direction * distance + tank.global_basis.y * height
	camera.global_position = tank.global_position + local_position
	var lerp_axis = lerp(camera.global_basis.y, tank.global_basis.y, _delta * 5).normalized()
	camera.look_at(camera.global_position - look_direction, lerp_axis)
