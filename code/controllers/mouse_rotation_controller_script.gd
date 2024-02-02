class_name MouseRotationController
extends Node

var origin : Node3D
var min_angle := -60.0
var max_angle := 60.0
var rotation_speed := 1.0
var event
var is_event = false

func _init(_origin, _min_angle, _max_angle, _rotation_speed):
	origin = _origin
	min_angle = _min_angle
	max_angle = _max_angle
	rotation_speed = _rotation_speed
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	origin.add_child(self)

func update(delta):
	if is_event:
		var axis_rotation_x = origin.global_basis.y
		var axis_rotation_y = origin.global_basis.x
		origin.rotate(axis_rotation_x, -event.relative.x * rotation_speed * delta)
		origin.rotate(axis_rotation_y, -event.relative.y * rotation_speed * delta)
		var max_radian = 60 * PI / 180
		origin.rotation.x = clamp(origin.rotation.x, -max_radian, max_radian)
		origin.rotation.z = 0
		is_event = false

func _input(_event):
	if _event is InputEventMouseMotion:
		event = _event
		is_event = true

func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		queue_free()