class_name WeaponCrouchState

var character
var weapon

func _init(_character):
	character = _character
	weapon = character.weapon
	character.crouch_aim_tree.is_active(true)
	
func update(_delta):
	character.move(character.move_input.move_direction() * 2)
	character.look_at_direction(character.look_input.look_direction())

func next():
	if !character.aim_input.is_aim():
		return StandState.new(character)

	return self

func exit():
	character.walk_aim_tree.is_active(false)
