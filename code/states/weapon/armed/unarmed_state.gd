class_name UnarmedState

var weapon

func _init(_weapon):
	weapon = _weapon

func update(_delta):
	pass

func next():
	if weapon.is_armed:
		return ArmedState.new(weapon)

	return self

func exit():
	pass
