class_name TouchScreen
extends Button

var drag_velocity = Vector2.ZERO
var event
var is_press = false

func _process(_delta):
	var is_drag = false
	if event is InputEventScreenDrag || event is InputEventMouseMotion:
		if is_press:
			drag_velocity = event.relative
			is_drag = true
	
	if !is_drag:
		drag_velocity = Vector2.ZERO

func _input(_event):
	event = _event

func velocity():
	return drag_velocity

func update(_delta):
	pass

func _on_button_up():
	is_press = false

func _on_button_down():
	is_press = true
