class_name CharacterCameraInput

var character
var stand_height = 1.5
var crouch_height = 1.0
var crawl_height = 0.5
var distance = 2.5
var aim_distance = 1.5
var side = 0
var aim_side = 0.8
var base_fov = 70.0
var aim_fov = 30.0

var camera_offset = Vector3(side, stand_height, distance)
var camera_fov = base_fov

func _init(_character):
	character = _character

func update(_delta):
	var _height = stand_height
	var _distance = distance
	var _side = side
	var _fov = base_fov
	
	if character.is_aim():
		_side = aim_side
		_fov = aim_fov
	
	if character.move_input.is_crouch():
		_height = crouch_height

	if character.move_input.is_crawl():
		_height = crawl_height
	
	camera_offset = camera_offset.lerp(Vector3(_side, _height, _distance), _delta * 5)
	camera_fov = lerp(camera_fov, _fov, _delta * 10)

func offset():
	return camera_offset

func min_angle():
	return -60

func max_angle():
	return 60

func fov():
	return camera_fov
