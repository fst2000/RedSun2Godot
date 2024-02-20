class_name MouseInput
extends Node

var mouse_velocity
var has_event = false
var sensitivity

func _init(character, _sensitivity = 0.2):
	character.add_child(self)
	sensitivity = _sensitivity

func update(_delta): pass

func _input(_event):
	if _event is InputEventMouseMotion:
		has_event = true
		mouse_velocity = _event.relative

func velocity() -> Vector2:
	if has_event:
		has_event = false
		return mouse_velocity * sensitivity
	else:
		return Vector2.ZERO
