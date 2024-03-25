class_name FloorState

var character
var state_machine

func _init(_character):
	character = _character
	character.look_at_direction(character.global_basis.z, Vector3.UP)
	state_machine = StateMachine.new(StandState.new(character))

func update(delta):
	state_machine.update(delta)

func next():
	if !character.is_on_floor():
		return FallState.new(character)
	
	if character.is_dead():
		return DeadState.new(character)
	
	if character.is_in_transport:
		return InTransportState.new(character)
	
	return self
	
func exit():
	state_machine.state.exit()
