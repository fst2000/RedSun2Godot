class_name TouchScreen
extends Control

var drag_velocity = Vector2.ZERO
var event

func _process(delta):
	if event is InputEventScreenDrag || event is InputEventMouseMotion:
		drag_velocity = event.relative
	else:
		drag_velocity = Vector2.ZERO
	
	print(drag_velocity)

func _input(_event):
	event = _event

func velocity():
	return drag_velocity
