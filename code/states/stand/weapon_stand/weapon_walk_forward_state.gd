class_name WeaponWalkForwardState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/walk_aim_forward")

func update(_delta):
	character.anim_player.speed_scale = character.move_input.move_input().length()

func exit():
	character.anim_player.speed_scale = 1.0

func next():
	var move_input = character.move_input.move_input()
	if move_input.length() == 0:
		return WeaponIdleState.new(character)
	
	return self
