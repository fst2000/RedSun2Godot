class_name ArmedState

var character

func _init(_character):
	character = _character
	character.weapon.anim_player.play("armed")

func update(_delta):
	pass

func next():
	if !character.weapon:
		return UnarmedState.new(character)
	else:
		if character.weapon.weapon_input.is_aim():
			return AimState.new(character)
	return self

func exit():
	pass
