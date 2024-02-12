class_name PressButton
extends TouchScreenButton

var weapon
var press_action

func initialize(_weapon, _press_action : Callable):
	weapon = _weapon
	press_action = _press_action

func _on_pressed():
	press_action.call()
