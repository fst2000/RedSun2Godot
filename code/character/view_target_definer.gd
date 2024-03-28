class_name ViewTargetDefiner

var area
var fov

func _init(_origin : Node3D, _look_input, _fov : float, _distance : float):
	area = ViewArea.new(_look_input, _distance)
	_origin.add_child(area)
	area.position = Vector3(0,0,0)
	fov = _fov * PI / 180

func get_target():
	var bodies = area.get_overlapping_bodies()
	if bodies: bodies = bodies.filter(
		func(body):
			var to_body_direction = (body.global_position - area.global_position).normalized()
			return area.global_basis.z.angle_to(to_body_direction) < fov * 0.5
	).filter(
		func(body):
			var ray = PhysicsRayQueryParameters3D.create(area.global_position, body.global_position, area.collision_mask)
			var collision = area.get_world_3d().direct_space_state.intersect_ray(ray)
			return body == collision.get("collider"))
	if bodies: return bodies[0]

func close():
	area.queue_free()
