class_name IdleState

var character

func _init(character):
	self.character = character
	character.anim_player.play("anim_move/idle")

func update(delta):
	pass

func next():
	if character.move_controller.move_direction().length() > 0:
		return WalkState.new(character)
	return self

func exit(): pass
