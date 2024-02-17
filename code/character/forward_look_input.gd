class_name ForwardLookInput

var origin

func _init(_origin : Node3D):
	origin = _origin

func look_direction():
	return origin.global_basis.z.normalized()
