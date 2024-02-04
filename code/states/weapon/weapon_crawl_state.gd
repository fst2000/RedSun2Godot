class_name WeaponCrawlState

var character
var weapon

func _init(_character):
	character = _character
	weapon = character.weapon
	
func update(_delta):
	character.look_at_direction(character.look_input.look_direction())

func next():
	if !character.aim_input.is_aim():
		return CrawlState.new(character)

	return self

func exit():
	character.walk_aim_tree.is_active(false)
