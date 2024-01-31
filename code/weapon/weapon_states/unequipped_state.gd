class_name UnequippedState

var weapon

func _init(_weapon):
	weapon = _weapon
func update(_delta): pass

func next():
	if weapon.is_equipped:
		return EquippedState.new(weapon)
	return self

func exit(): pass
