class_name ReloadStandState

var weapon
var character

func _init(_weapon, anim_time = 0.0):
	weapon = _weapon
	character = weapon.character
	weapon.anim_player.play("reload")
	weapon.anim_player.seek(anim_time)

func update(_delta): pass

func exit(): pass

func next():
	if character.is_crawl():
		return ReloadCrawlState.new(weapon, weapon.anim_player.current_animation_position)
	
	return self
