class_name CharacterCameraController

var character
var camera : Node3D
var camera_input

func _init(_character, _camera, _camera_input):
	character = _character
	camera = _camera
	camera_input = _camera_input

func update(_delta):
	camera.look_at_direction(character.look_input.look_direction(), character.global_basis.y)
	var quaternion = camera.quaternion
	var offset = camera_input.offset()
	var local_pos = (quaternion * Vector3(offset.x, 0, offset.z)) + Vector3(0, offset.y, 0)
	camera.global_position = character.global_position + local_pos
	camera.fov = camera_input.fov()
