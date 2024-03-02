extends Node2D

@onready var basis = $Basis
@onready var stick = $Stick

func input() -> Vector2:
	return (stick.position + stick.size * 0.5) / (basis.size * 0.5)

func _input(event):
	var is_touch = false
	if event is InputEventScreenTouch || event is InputEventScreenDrag || event is InputEventMouseMotion:
		var touch_position = event.position
		if touch_position.distance_to(global_position) < basis.size.x * 0.5:
			is_touch = true
			stick.global_position = event.position - (stick.size * 0.5)
	if !is_touch:
		stick.position = -stick.size * 0.5
