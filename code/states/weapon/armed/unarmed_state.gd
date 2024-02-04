class_name UnarmedState

var character

func _init(_character):
	character = _character

func update(_delta):
	pass

func next():
	if character.weapon:
		return ArmedState.new(character)

	return self

func exit():
	pass
