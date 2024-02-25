class_name AreaBodyDetector

var area : Area3D
var enter_action
var update_action
var exit_action

var bodies : Array

func _init(_area : Area3D, _enter_action : Callable, _update_action : Callable, _exit_action : Callable):
	area = _area
	enter_action = _enter_action
	update_action = _update_action
	exit_action = _exit_action

func update(_delta):
	var overlapping_bodies : Array
	if area.monitoring: overlapping_bodies = area.get_overlapping_bodies()
	for ov_body in overlapping_bodies:
		if !bodies.has(ov_body):
			enter_action.call(ov_body)
			bodies.append(ov_body)
	for body in bodies:
		if !overlapping_bodies.has(body):
			exit_action.call(body)
			bodies.erase(body)
		else:
			update_action.call(body)
