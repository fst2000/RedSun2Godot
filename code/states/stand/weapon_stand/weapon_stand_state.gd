class_name WeaponStandState

var character
var state_machine

func _init(_character):
	character = _character
	character.shape_stand()
	state_machine = StateMachine.new(WeaponIdleState.new(character))
	character.anim_player.set_default_blend_time(0.1)

func update(_delta):
	state_machine.update(_delta)
	character.move(character.move_direction() * 2.5)
	character.look_at_direction(character.look_direction())

func next():
	if !character.is_aim():
		return StandState.new(character)
	
	if character.is_crouch() || character.is_crawl():
		return WeaponCrouchState.new(character)
	
	return self

func exit():
	character.move(Vector3.ZERO)
	state_machine.state.exit()
