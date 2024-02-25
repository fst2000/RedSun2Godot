class_name SlotButton
extends TouchScreenButton

var item
var press_action

func initialize(_item, _press_action : Callable):
	item = _item
	press_action = _press_action

func _process(delta):
	if is_pressed():
		press_action.call()
