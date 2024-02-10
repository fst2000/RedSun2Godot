class_name ArmedCrawlState

var weapon
var character

func _init(_weapon):
	weapon = _weapon
	character = weapon.character
	weapon.anim_player.stop()

func update(_delta):
	pass

func next():
	if !character.move_input.is_crawl():
		return ArmedStandState.new(character)

	return self

func exit():
	pass


