class_name WeaponCrawlState

var character

func _init(_character):
	character = _character
	character.shape_crawl()
	character.anim_player.play("crawl_idle_weapon")
	character.anim_player.set_default_blend_time(0.1)
	
func update(_delta):
	character.look_at_direction(character.look_direction())

func next():
	if !character.is_aim():
		return CrawlState.new(character)
	
	if !character.is_crawl() && character.can_crouch():
		return WeaponCrouchState.new(character)
	
	return self

func exit():
	pass
