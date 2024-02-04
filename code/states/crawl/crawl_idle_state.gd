class_name CrawlIdleState

var character

func _init(_character):
	character = _character
	character.anim_player.play("crawl_idle")

func update(_delta):
	pass

func next():
	if character.move_input.move_direction().length() > 0:
		return CrawlWalkState.new(character)
	
	if character.weapon.weapon_input.is_aim():
		return WeaponCrawlState.new(character)

	return self
func exit(): pass
