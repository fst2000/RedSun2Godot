class_name ViewArea
extends Area3D

var look_input

func _init(_look_input, _distance : float):
	look_input = _look_input
	var sphere_shape = SphereShape3D.new()
	sphere_shape.radius = _distance
	var collision_shape = CollisionShape3D.new()
	collision_shape.shape = sphere_shape
	add_child(collision_shape)
	set_monitorable(false)

func _process(_delta):
	look_at(global_position - look_input.look_direction())
