class_name StandState

var character
var state_machine

func _init(_character):
	character = _character
	var stand_state
	if character.is_aim(): stand_state = WeaponStandState.new(character)
	else: stand_state = IdleState.new(character)
	state_machine = StateMachine.new(stand_state)

func update(delta):
	state_machine.update(delta)

func next():
	if character.is_crouch():
		return CrouchState.new(character)

	if character.is_crawl():
		return CrawlState.new(character)
	
	if character.is_aim():
		character.anim_player.set_default_blend_time(0)
		return WeaponStandState.new(character)
	
	return self

func exit():
	state_machine.state.exit()
