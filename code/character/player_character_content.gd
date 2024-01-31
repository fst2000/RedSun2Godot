class_name PlayerCharacterContent

static func content(character):
	var camera = character.get_tree().current_scene.get_node("Camera")
	character.move_input = KeyboardMoveInput.new(camera)
	
	var camera_rotation_controller = MouseRotationController.new(camera, -60, 60, 0.25)
	character.camera_controller = PlayerCameraController.new(camera, character, camera_rotation_controller, 2.5, 1.5)
	character.aim_system = CharacterAimSystem.new(character, character.skeleton, character.spine_bone)
	character.aim_controller = CameraAimController.new(camera, character.aim_system)
