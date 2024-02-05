class_name ArmedState

var character
var state_machine

func _init(_character):
	character = _character
	var armed_state
	if character.move_input.is_crawl():
		armed_state = ArmedCrawlState.new(character)
	else:
		armed_state = ArmedStandState.new(character)
	state_machine = StateMachine.new(armed_state)

func update(_delta):
	state_machine.update(_delta)

func next():
	if !character.weapon:
		return UnarmedState.new(character)
	else:
		if character.weapon.weapon_input.is_aim():
			return AimState.new(character)
	return self

func exit():
	pass
