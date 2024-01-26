extends Node

var crouch_value := false
var crawl_value := false
@onready var camera = get_tree().current_scene.get_node("Camera")

func _ready():
	print(get_tree().current_scene.name)

func _process(delta):
	if Input.is_action_just_pressed("crouch"): crouch_value = !crouch_value
	if Input.is_action_just_pressed("crawl"): crawl_value = !crawl_value
	
func is_crouch():
	return crouch_value

func is_crawl():
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
