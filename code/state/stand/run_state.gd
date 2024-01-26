class_name RunState

var character

func _init(character):
	self.character = character
	character.anim_player.play("anim_move/run")
	character.anim_player.speed_scale = 1.5

func update(delta):
	pass

func next():
	if character.controller.move_direction().length() < 0.5:
		return WalkState.new(character)
	return self

func exit():
	character.anim_player.speed_scale = 1.0
