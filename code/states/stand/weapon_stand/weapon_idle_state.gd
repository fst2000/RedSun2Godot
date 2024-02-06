class_name WeaponIdleState

var character

func _init(_character):
	character = _character
	character.anim_player.play("anim_move/idle_aim")

func update(_delta):
	pass

func exit():
	pass

func next():
	return self
