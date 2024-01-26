class_name StandState

var character
var state_machine

func _init(character):
	self.character = character
	state_machine = StateMachine.new(IdleState.new(character))

func update(delta):
	var move_direction = character.controller.move_direction()
	character.look_at_direction(move_direction)
	character.velocity = move_direction * 5
	state_machine.update(delta)

func next():
	if character.controller.is_crouch():
		return CrouchState.new(character)

	return self

func exit(): pass
