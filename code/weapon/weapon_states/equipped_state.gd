class_name EquippedState

var weapon

func _init(_weapon):
	weapon = _weapon
	weapon.anim_player.play("equipped")

func update(_delta):
	pass

func next():
	if !weapon.is_equipped:
		return UnequippedState.new(weapon)

	if weapon.weapon_input.is_armed():
		return ArmedState.new(weapon)

	return self

func exit(): pass
