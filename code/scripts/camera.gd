extends Camera3D

var camera_controller
func _ready():
	camera_controller = EmptyCameraController.new()

func _process(delta):
	camera_controller.update(delta)

func look_at_direction(direction, axis):
	if direction.length() > 0.01: 
		look_at(global_position + direction)
