class_name PlayerAimInput

var camera

func _init(_camera):
	camera = _camera

func aim_direction():
	return -camera.basis.z
