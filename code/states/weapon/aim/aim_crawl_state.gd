class_name AimCrawlState

var weapon

func _init(_weapon):
	weapon = _weapon
	weapon.anim_player.play("aim_crawl")

func update(_delta):
	pass

func next():
	if !weapon.character.move_input.is_crawl():
		return AimStandState.new(weapon)

	return self

func exit():
	pass
