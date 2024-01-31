class_name ArmedState

var weapon

func _init(_weapon):
	weapon = _weapon
	weapon.anim_player.play("armed")
func update(_delta):
	pass

func next():
	if weapon.weapon_input.is_aim():
		return AimState.new(weapon)
	
	if !weapon.weapon_input.is_armed():
		return EquippedState.new(weapon)

	return self

func exit(): pass
