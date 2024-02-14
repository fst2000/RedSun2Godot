class_name PlayerCharacterContent

static func content(character):
	character.equip_manager = UIEquipManager.new(character)
	
	
	character.look_input = PlayerLookInput.new(character, MouseInput.new(character), character.update_event)
	character.move_input = KeyboardMoveInput.new(character.look_input)
	character.aim_system = CharacterAimSystem.new(
		character,
		character.skeleton,
		character.spine_bone)
