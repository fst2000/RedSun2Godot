class_name UICharacterInput
extends Control

@onready var pose_buttons = $PoseButtons
@onready var joystick = $Joystick
@onready var touch_screen = $TouchScreen
var look_input

func initialize(_character):
	_character.add_child(self)
	look_input = SlideLookInput.new(_character, touch_screen, 60)

func update(_delta):
	pass

func look_direction():
	return look_input.look_direction()

func move_direction():
	var joystick_input = joystick.input()
	var move_input = Vector3(joystick_input.x, 0, joystick_input.y)
	var look_quaternion = Transform3D.IDENTITY.looking_at(look_input.look_direction()).basis.get_rotation_quaternion()
	var move_dir = (look_quaternion * move_input).slide(Vector3.UP).normalized()
	return move_dir

func is_crouch():
	return pose_buttons.is_crouch()

func is_crawl():
	return pose_buttons.is_crawl()

func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		queue_free()
