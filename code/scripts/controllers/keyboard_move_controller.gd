class_name KeyboardMoveController

var crouch_value := false
var crawl_value := false
var camera : Node3D

func _init(camera):
	self.camera = camera

func is_crouch():
	if Input.is_action_just_pressed("crouch"): crouch_value = !crouch_value
	return crouch_value

func is_crawl():
	if Input.is_action_just_pressed("crawl"): crawl_value = !crawl_value
	return crawl_value

func move_direction():
	var input = Vector3(
		Input.get_axis("right", "left"),
		0,
		Input.get_axis("down", "up"))
	var input_strength = min(1, input.length())
	var direction = -(camera.quaternion * input)
	direction = direction.slide(Vector3.UP).normalized() * input_strength
	return direction
