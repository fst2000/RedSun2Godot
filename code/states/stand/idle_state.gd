class_name IdleState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/idle")

func update(_delta):
	pass

func next():
	if character.move_input.move_direction().length() > 0:
		return WalkState.new(character)
	
	if character.is_aim():
		return WeaponStandState.new(character)

	return self

func exit(): pass
