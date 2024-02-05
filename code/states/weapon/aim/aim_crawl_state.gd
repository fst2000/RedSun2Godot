class_name AimCrawlState

var character
var weapon

func _init(_character):
	character = _character
	weapon = character.weapon
	weapon.anim_player.play("aim_crawl")

func update(_delta):
	pass

func next():
	if !character.move_input.is_crawl():
		return AimStandState.new(character)

	return self

func exit():
	weapon.anim_player.stop()
