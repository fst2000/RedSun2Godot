class_name CrouchWalkState

var character

func _init(character):
	self.character = character
	character.anim_player.play("anim_move/crouch")

func update(delta): pass

func next():
	var move_strength = character.move_controller.move_direction().length()
	if move_strength <= 0.01:
		return CrouchIdleState.new(character)

	return self

func exit(): pass
