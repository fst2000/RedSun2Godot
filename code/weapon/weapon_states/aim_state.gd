class_name AimState

var weapon

func _init(_weapon):
	weapon = _weapon
	weapon.anim_player.play("aim")

func update(_delta):
	weapon.aim_controller.update(_delta)

func next():
	if !weapon.weapon_input.is_aim():
		return ArmedState.new(weapon)

	return self

func exit():
	pass
