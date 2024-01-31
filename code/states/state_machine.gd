class_name StateMachine

var state

func _init(_state):
	state = _state

func update(delta):
	var next = state.next()
	if next != state:
		state.exit()
		state = next
	state.update(delta)
