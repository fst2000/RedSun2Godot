class_name TouchScreen
extends Control

var drag_velocity = Vector2.ZERO

func _input(event):
	if event is InputEventScreenDrag:
		drag_velocity = event.relative
	else:
		drag_velocity = Vector2.ZERO

func velocity():
	return drag_velocity
