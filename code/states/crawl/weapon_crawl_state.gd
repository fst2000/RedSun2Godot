class_name WeaponCrawlState

var character

func _init(_character):
	character = _character
	character.anim_player.play("crawl_idle_weapon")
	character.anim_player.set_default_blend_time(0.1)
	
func update(_delta):
	character.look_at_direction(character.look_input.look_direction())

func next():
	if !character.is_aim():
		return CrawlState.new(character)
	
	if !character.move_input.is_crawl():
		return WeaponCrouchState.new(character)
	
	return self

func exit():
	pass
