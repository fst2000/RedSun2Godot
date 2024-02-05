class_name ArmedStandState

var character

func _init(_character):
	character = _character
	character.weapon.anim_player.play("armed")

func update(_delta):
	pass

func next():
	if character.move_input.is_crawl():
		return ArmedCrawlState.new(character)

	return self

func exit():
	pass

