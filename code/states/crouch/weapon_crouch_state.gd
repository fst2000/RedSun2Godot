class_name WeaponCrouchState

var character
var weapon

func _init(_character):
	character = _character
	weapon = character.weapon
	character.anim_player.play("anim_move/crouch_idle_aim")
	
func update(_delta):
	character.move(character.move_input.move_direction() * 2)
	character.look_at_direction(character.look_input.look_direction())

func next():
	if !weapon.weapon_input.is_aim():
		return CrouchIdleState.new(character)
	
	if character.move_input.is_crawl():
		return WeaponCrawlState.new(character)
	
	if !character.move_input.is_crouch():
		return WeaponStandState.new(character)

	return self

func exit():
	character.move(Vector3.ZERO)
