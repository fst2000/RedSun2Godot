class_name FallState

var character
var state_machine

func _init(_character):
	character = _character
	state_machine = StateMachine.new(StandState.new(character))

func update(delta):
	character.fall(delta)
	state_machine.update(delta)

func next():
	if character.is_on_floor():
		return FloorState.new(character)
	return self

func exit():
	state_machine.state.exit()
