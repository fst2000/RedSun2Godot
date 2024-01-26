class_name RunState

var character

func _init(character):
	self.character = character
	character.anim_player.play("anim_move/run")

func update(delta):
	pass

func next():
	if character.controller.move_direction().length() < 0.5:
		return WalkState.new(character)
	return self

func exit(): pass
