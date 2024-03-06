extends Control

@onready var basis = $Basis
@onready var stick = $Stick
var is_mouse_on = false
var event

func input() -> Vector2:
	return (stick.position + stick.size * 0.5) / (basis.size * 0.5)

func _process(_delta):
	var is_touch = false
	if is_mouse_on && (event is InputEventScreenTouch || event is InputEventScreenDrag || event is InputEventMouseMotion):
		var touch_position = event.position
		if touch_position.distance_to(global_position) < basis.size.x * 0.5:
			is_touch = true
			var stick_offset = event.position - global_position
			stick.position = stick_offset.normalized() * min(stick_offset.length(), basis.size.x * 0.5) - (stick.size * 0.5)
	if !is_touch:
		stick.position = -stick.size * 0.5


func _input(_event):
	event = _event


func _on_mouse_entered():
	is_mouse_on = true


func _on_mouse_exited():
	is_mouse_on = false
