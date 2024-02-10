class_name ArmedState

var weapon
var character
var state_machine

func _init(_weapon):
	weapon = _weapon
	character = weapon.character
	var armed_state
	if character.move_input.is_crawl():
		armed_state = ArmedCrawlState.new(character)
	else:
		armed_state = ArmedStandState.new(character)
	state_machine = StateMachine.new(armed_state)

func update(_delta):
	state_machine.update(_delta)

func next():
	if !weapon.is_armed:
		return UnarmedState.new(weapon)
	else:
		if weapon.is_aim():
			return AimState.new(weapon)
	return self

func exit():
	pass
