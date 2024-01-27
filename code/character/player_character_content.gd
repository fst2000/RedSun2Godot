class_name PlayerCharacterContent

static func content(character):
	var camera = character.get_tree().current_scene.get_node("Camera")
	character.camera = camera
	character.move_controller = KeyboardMoveController.new(camera)
	character.anim_player.set_root_node(character.soldier.get_path())
	character.camera_controller = PlayerCameraController.new(camera, character, 2.5, 1.5)
