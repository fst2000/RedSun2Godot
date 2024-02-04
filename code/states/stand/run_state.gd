class_name RunState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/run")
	character.anim_player.speed_scale = 1.5

func update(_delta):
	var move_direction = character.move_input.move_direction()
	character.look_at_direction(move_direction)
	character.move(move_direction * 5)

func next():
	if character.move_input.move_direction().length() < 0.5:
		return WalkState.new(character)
	
	if character.weapon.weapon_input.is_aim():
		return WeaponStandState.new(character)
	
	return self

func exit():
	character.anim_player.speed_scale = 1.0
	character.move(Vector3.ZERO)
