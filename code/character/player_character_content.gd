class_name PlayerCharacterContent

static func content(character):
	character.equip_manager = UIEquipManager.new(character)
	
	var camera = character.get_tree().current_scene.get_node("Camera")
	character.move_input = KeyboardMoveInput.new(camera)
	
	character.look_input = PlayerLookInput.new(camera)
	character.aim_system = CharacterAimSystem.new(
		character,
		character.skeleton,
		character.spine_bone)
	var camera_slide_input = MouseInput.new()
	camera.add_child(camera_slide_input)
	character.camera_controller = CharacterCameraController.new(
		character,
		camera,
		camera_slide_input,
		CharacterCameraInput.new(character))
