class_name PlayerCharacterContent

static func content(character):
	var camera = character.get_tree().current_scene.get_node("Camera")
	character.move_controller = KeyboardMoveController.new(camera)
	character.camera_controller = PlayerCameraController.new(camera, character, 2.5, 1.5)
