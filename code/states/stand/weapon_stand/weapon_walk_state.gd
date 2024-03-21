class_name WeaponWalkState

var character
var move_map := {
	Vector2(1,0) : "anim_move/walk_aim_left",
	Vector2(-1,0) : "anim_move/walk_aim_right",
	Vector2(0,1) : "anim_move/walk_aim_forward",
	Vector2(0,-1) : "anim_move/walk_aim_back"}

var current_anim

func _init(_character):
	character = _character

func update(_delta):
	var move_dir_local = character.quaternion.inverse() * character.move_direction()
	var move_blend = Vector2(move_dir_local.x, move_dir_local.z)
	var move_key
	if abs(move_blend.x) > abs(move_blend.y):
		move_key = Vector2(move_blend.x, 0).normalized()
	else:
		move_key = Vector2(0, move_blend.y).normalized()
	var move_key_anim = move_map.get(move_key)
	if move_key_anim != current_anim:
		current_anim = move_key_anim
		character.anim_player.play(move_key_anim)
	character.anim_player.speed_scale = character.move_direction().length()

func exit():
	character.anim_player.speed_scale = 1.0

func next():
	if character.move_direction().length() < 0.01:
		return WeaponIdleState.new(character)
	
	return self
