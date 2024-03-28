class_name BotMoveInput

var bot
var nav : NavigationAgent3D
var target_definer

func _init(_bot, _target_definer):
	bot = _bot
	nav = NavigationAgent3D.new()
	_bot.add_child(nav)
	target_definer = _target_definer

func update(_delta):
	pass

func move_direction():
	var target = target_definer.get_target()
	if target:
		nav.target_position = target.global_position
		return nav.get_next_path_position() - bot.global_position
	else:
		return Vector3.ZERO

func is_crouch():
	return false

func is_crawl():
	return false

func close():
	target_definer.close()
	nav.queue_free()
