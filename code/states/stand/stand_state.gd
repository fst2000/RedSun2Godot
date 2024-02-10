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
	if character.move_input.is_crouch():
		return CrouchState.new(character)

	if character.move_input.is_crawl():
		return CrawlState.new(character)
	
	if character.is_aim():
		return WeaponStandState.new(character)
	
	return self

func exit():
	state_machine.state.exit()
