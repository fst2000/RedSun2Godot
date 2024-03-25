class_name ViewRayTargetDefiner

var area
var look_input
var fov

func _init(_origin : Node3D, _look_input, _fov : float, _distance : float):
	area = Area3D.new()
	var sphere_shape = SphereShape3D.new()
	sphere_shape.radius = _distance
	var collision_shape = CollisionShape3D.new()
	collision_shape.shape = sphere_shape
	area.add_child(collision_shape)
	_origin.add_child(area)
	area.position = Vector3(0,0,0)
	look_input = _look_input
	fov = _fov * PI / 180

func get_target():
	var view_targets = view_target_definer.get_targets()
	if bodies: bodies = bodies.filter(
		func(body):
			var ray = PhysicsRayQueryParameters3D.create(view_area.global_position, body.global_position, view_area.collision_mask)
			var collision := view_area.get_world_3d().direct_space_state.intersect_ray(ray)
			return body == collision.get("collider"))
	if bodies: return bodies[0]
