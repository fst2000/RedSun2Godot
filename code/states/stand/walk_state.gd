class_name WalkState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/walk")

func update(_delta):
	var move_direction = character.move_direction()
	character.look_at_direction(move_direction)
	character.move(move_direction * 2)

func next():
	var move_strength = character.move_direction().length()
	if move_strength > 0.5:
		return RunState.new(character)
	
	if move_strength <= 0.01:
		return IdleState.new(character)
	
	if character.is_aim():
		return WeaponStandState.new(character)
	
	return self

func exit():
	character.move(Vector3.ZERO)
