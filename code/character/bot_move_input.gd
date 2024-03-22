class_name BotMoveInput

var bot
var nav : NavigationAgent3D
var target_definer

func _init(_bot, _nav : NavigationAgent3D, _target_definer):
	bot = _bot
	nav = _nav
	target_definer = _target_definer

func move_direction():
	var target = target_definer.get_target()
	if target:
		nav.target_position = target.global_position
		return nav.get_next_path_position() - bot.global_position
	else:
		return Vector3.ZERO
