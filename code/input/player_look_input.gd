class_name PlayerLookInput

var camera

func _init(_camera):
	camera = _camera

func look_direction():
	return -camera.basis.z
