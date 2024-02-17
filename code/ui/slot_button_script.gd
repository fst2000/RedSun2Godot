class_name SlotButton
extends TouchScreenButton

var item
var press_action
var destroy_condition

func initialize(_item, _press_action : Callable, _destroy_condition : Callable):
	item = _item
	press_action = _press_action
	destroy_condition = _destroy_condition

func _on_pressed():
	press_action.call()

func _process(_delta):
	if destroy_condition.call(): queue_free()
