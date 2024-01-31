class_name CrouchWalkState

var character

func _init(_character):
	self.character = _character
	character.anim_player.play("anim_move/crouch")

func update(_delta): pass

func next():
	var move_strength = character.move_input.move_direction().length()
	if move_strength <= 0.01:
		return CrouchIdleState.new(character)

	return self

func exit(): pass
