class_name CharacterCameraController

var character
var camera : Node3D
var slide_input
var camera_input
func _init(_character, _camera, _slide_input, _camera_input):
	character = _character
	camera = _camera
	slide_input = _slide_input
	camera_input = _camera_input
	
func update(_delta):
	camera_input.update(_delta)
	var min_angle = camera_input.min_angle()
	var max_angle = camera_input.max_angle()
	var slide_velocity = slide_input.velocity() * _delta
	camera.rotate(camera.basis.x, -slide_velocity.y)
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, min_angle, max_angle)
	camera.rotate(Vector3.UP, -slide_velocity.x)
	camera.rotation.z = 0
	var quaternion = camera.quaternion
	var offset = camera_input.offset()
	var local_pos = (quaternion * Vector3(offset.x, 0, offset.z)) + Vector3(0, offset.y, 0)
	camera.global_position = character.global_position + local_pos
	camera.fov = camera_input.fov()
