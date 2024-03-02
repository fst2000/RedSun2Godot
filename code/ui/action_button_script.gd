class_name ActionButton
extends TouchScreenButton

var press_action
var position_func
var has_pressed = false

func initialize(_press_action : Callable, _position_func = null):
	press_action = _press_action
	position_func = _position_func

func _process(_delta):
	if position_func:
		position = position_func.call()
	if is_pressed():
		if !has_pressed:
			has_pressed = true
			press_action.call()
	else:
		has_pressed = false
