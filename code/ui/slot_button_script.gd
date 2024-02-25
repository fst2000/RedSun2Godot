class_name SlotButton
extends TouchScreenButton

var item
var press_action
var has_pressed = false

func initialize(_item, _press_action : Callable):
	item = _item
	press_action = _press_action

func _process(_delta):
	if is_pressed():
		if !has_pressed:
			has_pressed = true
			press_action.call()
	else:
		has_pressed = false
