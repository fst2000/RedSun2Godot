class_name FallState

var character

func _init(_character):
	character = _character
	character.shape_stand()

func update(delta):
	character.fall(delta)
	character.move_and_slide()

func next():
	
	if character.is_in_transport:
		return InTransportState.new(character)
	
	if character.is_on_floor():
		return FloorState.new(character)
	
	if character.is_dead():
		return DeadState.new(character)
	
	return self

func exit():
	pass
