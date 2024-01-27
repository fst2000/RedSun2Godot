class_name WalkState

var character

func _init(character):
	self.character = character
	character.anim_player.play("anim_move/walk")

func update(delta):
	pass

func next():
	var move_strength = character.move_controller.move_direction().length()
	if move_strength > 0.5:
		return RunState.new(character)
	
	if move_strength <= 0.01:
		return IdleState.new(character)

	return self

func exit(): pass
