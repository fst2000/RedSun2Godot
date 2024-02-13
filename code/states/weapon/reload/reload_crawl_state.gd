class_name ReloadCrawlState

var weapon
var character

func _init(_weapon, anim_time = 0.0):
	weapon = _weapon
	character = weapon.character
	weapon.anim_player.play("reload_crawl")
	weapon.anim_player.seek(anim_time)

func update(_delta): pass

func exit(): pass

func next():
	if !character.move_input.is_crawl():
		return ReloadStandState.new(weapon, weapon.anim_player.current_animation_position)
	
	return self
