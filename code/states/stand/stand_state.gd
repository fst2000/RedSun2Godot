class_name StandState

var character
var state_machine

func _init(character):
	self.character = character
	state_machine = StateMachine.new(IdleState.new(character))

func update(delta):
	var move_direction = character.move_controller.move_direction()
	character.look_at_direction(move_direction)
	character.move(move_direction * 5)
	state_machine.update(delta)

func next():
	if character.move_controller.is_crouch():
		return CrouchState.new(character)

	if character.move_controller.is_crawl():
		return CrawlState.new(character)

	return self

func exit():
	state_machine.state.exit()