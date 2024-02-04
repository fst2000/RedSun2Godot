class_name CrawlState

var character
var state_machine

func _init(_character):
	character = _character
	state_machine = StateMachine.new(CrawlIdleState.new(character))

func update(delta):
	state_machine.update(delta)

func next():
	if !character.move_input.is_crawl():
		return CrouchState.new(character)

	return self

func exit():
	state_machine.state.exit()
