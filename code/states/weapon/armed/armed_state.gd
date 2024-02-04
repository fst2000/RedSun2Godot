class_name ArmedState

var character

func _init(_character):
	character = _character
	character.weapon.anim_player.play("armed")

func update(_delta):
	pass

func next():
	if !character.weapon:
		return UnarmedState.new(character)

	return self

func exit():
	character.weapon.anim_player.stop()
