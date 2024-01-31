class_name PlayerCameraController

var camera : Node
var origin
var rotation_controller
var distance
var height

func _init(_camera, _origin, _rotation_controller, _distance, _height):
	camera = _camera
	origin = _origin
	rotation_controller = _rotation_controller
	distance = _distance
	height = _height

func update(_delta):
	rotation_controller.update(_delta)
	var local_position = camera.basis.z * distance + origin.basis.y * height
	camera.global_position = origin.global_position + local_position
