class_name DeadState

var character

func _init(_character):
	character = _character
	character.die()

func update(_deta):
	pass

func exit():
	pass

func next():
	return self
