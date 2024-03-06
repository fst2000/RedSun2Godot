class_name WeaponCrouchState

var character

func _init(_character):
	character = _character
	character.shape_crouch()
	character.anim_player.play("anim_move/crouch_idle_aim")
	character.anim_player.set_default_blend_time(0.1)
	
func update(_delta):
	character.move(character.move_direction() * 2)
	character.look_at_direction(character.look_direction())

func next():
	if !character.is_aim():
		return CrouchState.new(character)
	
	if character.is_crawl():
		return WeaponCrawlState.new(character)
	
	if !character.is_crouch() && character.can_stand():
		return WeaponStandState.new(character)

	return self

func exit():
	character.move(Vector3.ZERO)
