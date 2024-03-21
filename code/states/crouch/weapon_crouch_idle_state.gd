class_name WeaponCrouchIdleState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/crouch_idle_aim")

func update(_delta):
	pass

func exit():
	pass

func next():
	
	if character.move_direction().length() > 0.01:
		return WeaponCrouchWalkState.new(character)
	
	return self
