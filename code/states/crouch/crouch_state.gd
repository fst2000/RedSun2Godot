class_name CrouchState

var character
var state_machine

func _init(_character):
	character = _character
	var crouch_state
	if character.is_aim(): crouch_state = WeaponCrouchState.new(character)
	else: crouch_state = CrouchIdleState.new(character)
	state_machine = StateMachine.new(crouch_state)

func update(delta):
	state_machine.update(delta)

func next():
	if !character.is_crouch():
		return StandState.new(character)

	if character.is_crawl():
		return CrawlState.new(character)
	
	if character.is_aim():
		character.anim_player.set_default_blend_time(0)
		return WeaponCrouchState.new(character)
	
	return self

func exit():
	state_machine.state.exit()
