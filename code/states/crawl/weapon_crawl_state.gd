class_name WeaponCrawlState

var character
var weapon

func _init(_character):
	character = _character
	weapon = character.weapon
	character.anim_player.play("crawl_idle")
	
func update(_delta):
	character.look_at_direction(character.look_input.look_direction())

func next():
	if !weapon.weapon_input.is_aim():
		return CrawlIdleState.new(character)
	
	if !character.move_input.is_crawl():
		return WeaponCrouchState.new(character)
	
	return self

func exit():
	pass
