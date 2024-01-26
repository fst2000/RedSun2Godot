class_name PlayerCameraController

var camera : Node
var origin
var player_controller

var distance
var height

func _init(camera, origin, distance, height):
	self.camera = camera
	self.origin = origin
	self.distance = distance
	self.height = height

func update(delta):
	var local_position = camera.basis.z * distance + origin.basis.y * height
	camera.global_position = origin.global_position + local_position
