class_name CrouchWalkState

var character

func _init(_character):
	self.character = _character
	character.anim_player.play("anim_move/crouch")

func update(_delta):
	var move_direction = character.move_direction()
	character.look_at_direction(move_direction)
	character.move(move_direction * 3)

func next():
	var move_strength = character.move_direction().length()
	if move_strength <= 0.01:
		return CrouchIdleState.new(character)

	if character.is_aim():
		return WeaponCrouchState.new(character)

	return self

func exit():
	character.move(Vector3.ZERO)
