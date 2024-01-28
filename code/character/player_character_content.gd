class_name PlayerCharacterContent

static func content(character):
	var camera = character.get_tree().current_scene.get_node("Camera")
	character.move_controller = KeyboardMoveController.new(camera)
	
	var camera_rotation_controller = MouseRotationController.new(camera, -60, 60, 0.25)
	character.camera_controller = MultipleController.new([
		camera_rotation_controller,
		PlayerCameraController.new(camera, character, 2.5, 1.5)])
