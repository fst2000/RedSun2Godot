class_name RunState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/run")
	character.anim_player.speed_scale = 1.5

func update(_delta):
	pass

func next():
	if character.move_input.move_direction().length() < 0.5:
		return WalkState.new(character)
	return self

func exit():
	character.anim_player.speed_scale = 1.0
