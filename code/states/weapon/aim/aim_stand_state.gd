class_name AimStandState

var weapon

func _init(_weapon):
	weapon = _weapon
	weapon.anim_player.play("aim")

func update(_delta):
	pass

func next():
	if weapon.character.move_input.is_crawl():
		return AimCrawlState.new(weapon)

	return self

func exit():
	pass
