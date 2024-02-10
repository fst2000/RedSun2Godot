class_name WeaponStandState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/idle_aim")

func update(_delta):
	character.move(character.move_input.move_direction() * 2.5)
	character.look_at_direction(character.look_input.look_direction())

func next():
	if !character.is_aim():
		return StandState.new(character)
	
	if character.move_input.is_crouch() || character.move_input.is_crawl():
		return WeaponCrouchState.new(character)
	
	return self

func exit():
	character.move(Vector3.ZERO)
