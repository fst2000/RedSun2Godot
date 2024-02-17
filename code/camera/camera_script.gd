extends Camera3D

var camera_controller = EmptyController.new()

func _process(delta):
	camera_controller.update(delta)

func look_at_direction(direction, axis):
	if direction.length() > 0.01: 
		look_at(global_position + direction, axis)

func switch(origin):
	camera_controller = origin.build_camera_controller(self)
