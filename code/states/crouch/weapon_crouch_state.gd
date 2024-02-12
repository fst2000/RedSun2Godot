class_name WeaponCrouchState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/crouch_idle_aim")
	character.anim_player.set_default_blend_time(0.1)
	
func update(_delta):
	character.move(character.move_input.move_direction() * 2)
	character.look_at_direction(character.look_input.look_direction())

func next():
	if !character.is_aim():
		return CrouchState.new(character)
	
	if character.move_input.is_crawl():
		return WeaponCrawlState.new(character)
	
	if !character.move_input.is_crouch():
		return WeaponStandState.new(character)

	return self

func exit():
	character.move(Vector3.ZERO)
