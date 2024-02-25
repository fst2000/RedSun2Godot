class_name UIGunInput

var ui
var gun

func _init(ui_prefab, gun):
	ui = ui_prefab.instantiate()
	gun.add_child(ui)

func is_shoot():
	return Input.is_action_pressed("fire")

func is_aim():
	return Input.is_action_pressed("aim")

func is_reload():
	return Input.is_action_just_pressed("reload")

func is_drop():
	return Input.is_action_pressed("drop")

func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		ui.queue_free()
