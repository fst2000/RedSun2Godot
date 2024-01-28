class_name FloorState

var character
var state_machine

func _init(character):
	self.character = character
	state_machine = StateMachine.new(StandState.new(character))

func update(delta):
	state_machine.update(delta)

func next():
	if !character.is_on_floor():
		return FallState.new(character)
	return self

func exit():
	state_machine.state.exit()
