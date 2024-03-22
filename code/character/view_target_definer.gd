class_name ViewTargetDefiner

var area : Area3D
var fov
var distance

func _init(_area, _fov : float, _distance : float):
	fov = _fov * PI / 180
	distance = _distance
	area = _area

func get_target():
	var bodies = area.get_overlapping_bodies()
	if bodies: bodies = bodies.filter(
		func(body):
			var to_body_dir = body.global_position - area.global_position
			return area.global_position.distance_to(body.global_position) < distance && area.global_basis.z.angle_to(to_body_dir) < fov * 0.5
	).filter(
		func(body):
			var ray = PhysicsRayQueryParameters3D.create(area.global_position, body.global_position, area.collision_mask)
			var collision := area.get_world_3d().direct_space_state.intersect_ray(ray)
			return body == collision.get("collider"))
	if bodies: return bodies[0]
