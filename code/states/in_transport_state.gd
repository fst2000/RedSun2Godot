class_name InTransportState

var character

func _init(_character):
	character = _character

func update(_delta):
	pass

func next():
	if !character.is_in_transport:
		return FloorState.new(character)
	
	return self

func exit():
	pass
