class_name WeaponWalkForwardState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/walk_aim_forward")

func update(_delta):
	character.anim_player.speed_scale = character.move_input.move_input().length()

func exit():
	pass

func next():
	return self
