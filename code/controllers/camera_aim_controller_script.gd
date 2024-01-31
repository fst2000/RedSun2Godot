class_name CameraAimController

var camera
var aim_system

func _init(_camera, _aim_system):
	camera = _camera
	aim_system = _aim_system

func update(_delta):
	aim_system.aim(-camera.basis.z)
