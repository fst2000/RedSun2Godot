class_name ArmedState

var weapon
var character
var state_machine

func _init(_weapon):
	weapon = _weapon
	character = weapon.character
	var armed_state
	if character.is_crawl():
		armed_state = ArmedCrawlState.new(weapon)
	else:
		armed_state = ArmedStandState.new(weapon)
	state_machine = StateMachine.new(armed_state)

func update(_delta):
	state_machine.update(_delta)

func next():
	if !weapon.is_armed:
		return UnarmedState.new(weapon)
	
	if weapon.is_aim():
		return AimState.new(weapon)
	
	if weapon.is_reload():
		return ReloadState.new(weapon)

	return self

func exit():
	state_machine.state.exit()
