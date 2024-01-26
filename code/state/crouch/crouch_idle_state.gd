class_name CrouchIdleState

var character

func _init(character):
	self.character = character
	character.anim_player.play("anim_move/crouch_idle")

func update(delta):
	pass

func next():
	if character.controller.move_direction().length() > 0:
		return CrouchWalkState.new(character)
	return self

func exit(): pass
