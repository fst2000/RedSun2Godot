class_name UIGunInput

var ui
var fire_button
var aim_button
var reload_button
var drop_button

var _is_shoot = false
var has_shoot = false
var _is_aim = false
var _is_reload = false
var has_reload = false
var _is_drop = false

func _init(_ui, _gun):
	ui = _ui
	_gun.add_child(ui)
	fire_button = ui.get_node("FireButton")
	aim_button = ui.get_node("AimButton")
	reload_button = ui.get_node("ReloadButton")
	drop_button = ui.get_node("DropButton")
	fire_button.initialize(
		func():
			_is_shoot = true
			has_shoot = true)
	aim_button.initialize(
		func():
			_is_aim = !_is_aim)
	reload_button.initialize(
		func():
			_is_reload = true
			has_reload = true)
	drop_button.initialize(
		func():
			_is_drop = true)

func update(_delta):
	if has_shoot:
		has_shoot = false
	else:
		_is_shoot = false
	
	if has_reload:
		has_reload = false
	else:
		_is_reload = false

func is_shoot():
	return _is_shoot

func is_aim():
	return _is_aim

func is_reload():
	return _is_reload

func is_drop():
	return _is_drop

func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		ui.queue_free()
