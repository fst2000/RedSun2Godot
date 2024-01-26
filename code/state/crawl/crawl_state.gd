class_name CrawlState

var character
var state_machine

func _init(character):
	self.character = character
	state_machine = StateMachine.new(CrawlIdleState.new(character))

func update(delta):
	var move_direction = character.controller.move_direction()
	character.look_at_direction(move_direction)
	character.velocity = move_direction * 2
	state_machine.update(delta)

func next():
	if !character.controller.is_crawl():
		return CrouchState.new(character)

	return self

func exit():
	state_machine.state.exit()
