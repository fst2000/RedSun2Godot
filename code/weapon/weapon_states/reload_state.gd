var weapon
var state_machine

func _init(_weapon):
	weapon = _weapon

func update(_delta):
	pass

func next():
	if !weapon.weapon_input.is_aim():
		return ArmedState.new(weapon)
	return self

func exit(): pass
