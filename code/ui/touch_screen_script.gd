class_name TouchScreen
extends Control

var drag_velocity = Vector2.ZERO
var event
var has_press = false
var last_position = Vector2.ZERO

func _process(_delta):
	if event is InputEventMouseMotion || event is InputEventScreenDrag:
		drag_velocity = event.relative
	else:
		drag_velocity = Vector2.ZERO

func velocity():
	return drag_velocity

func update(_delta):
	pass

func _input(_event):
	event = _event
