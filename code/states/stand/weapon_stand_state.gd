class_name WeaponStandState

var character
var weapon

func _init(_character):
	character = _character
	weapon = character.weapon
	character.walk_aim_tree.set_active(true)
	
func update(_delta):
	character.move(character.move_input.move_direction() * 3)
	character.look_at_direction(character.look_input.look_direction())
	var move_input = character.move_input.move_input()
	var anim_blend = Vector2(move_input.x, move_input.z)
	character.walk_aim_tree["parameters/blend_position"] = anim_blend

func next():
	if !weapon.weapon_input.is_aim():
		return IdleState.new(character)
	
	if character.move_input.is_crouch() || character.move_input.is_crawl():
		return WeaponCrouchState.new(character)
	
	return self

func exit():
	character.walk_aim_tree.set_active(false)
	character.move(Vector3.ZERO)
