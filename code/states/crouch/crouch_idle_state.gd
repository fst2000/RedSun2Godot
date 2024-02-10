class_name CrouchIdleState

var character

func _init(_character):
	self.character = _character
	character.anim_player.play("anim_move/crouch_idle")

func update(_delta):
	pass

func next():
	if character.move_input.move_direction().length() > 0:
		return CrouchWalkState.new(character)
	
	if character.is_aim():
		return WeaponCrouchState.new(character)

	return self

func exit(): pass
