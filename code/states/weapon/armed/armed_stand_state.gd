class_name ArmedStandState

var weapon
var character

func _init(_weapon):
	weapon = _weapon
	character = weapon.character
	weapon.anim_player.play("armed")

func update(_delta):
	pass

func next():
	if character.move_input.is_crawl():
		return ArmedCrawlState.new(character)

	return self

func exit():
	pass

