class_name WeaponSlotButton
extends TouchScreenButton

var weapon
var press_action
var destroy_condition

func initialize(_weapon, _press_action : Callable, _destroy_condition : Callable):
	weapon = _weapon
	press_action = _press_action
	destroy_condition = _destroy_condition

func _on_pressed():
	press_action.call()

func _process(_delta):
	if destroy_condition.call(): queue_free()
