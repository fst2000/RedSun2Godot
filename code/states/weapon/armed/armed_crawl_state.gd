class_name ArmedCrawlState

var character

func _init(_character):
	character = _character
	character.weapon.anim_player.stop()

func update(_delta):
	pass

func next():
	if !character.move_input.is_crawl():
		return ArmedStandState.new(character)

	return self

func exit():
	pass


