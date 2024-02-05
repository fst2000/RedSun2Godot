class_name WeaponStandState

var character
var weapon

func _init(_character):
	character = _character
	weapon = character.weapon
	character.anim_player.play("anim_move/idle_aim")

func update(_delta):
	character.move(character.move_input.move_direction() * 2.5)
	character.look_at_direction(character.look_input.look_direction())

func next():
	if !weapon.weapon_input.is_aim():
		return IdleState.new(character)
	
	if character.move_input.is_crouch() || character.move_input.is_crawl():
		return WeaponCrouchState.new(character)
	
	return self

func exit():
	character.move(Vector3.ZERO)
