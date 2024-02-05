class_name AimStandState

var character
var weapon

func _init(_character):
	character = _character
	weapon = character.weapon
	weapon.anim_player.play("aim")

func update(_delta):
	pass

func next():
	if character.move_input.is_crawl():
		return AimCrawlState.new(character)

	return self

func exit():
	weapon.anim_player.stop()
