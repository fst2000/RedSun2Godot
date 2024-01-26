class_name StandState

var character

func _init(character):
	self.character = character
	character.anim_player.play("anim_move/idle")

func update(delta):
	character.velocity = character.controller.move_direction() * 5

func next():
	return self

func exit(): pass
