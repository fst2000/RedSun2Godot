class_name AimCrawlState

var character

func _init(_character):
	character = _character

func update(_delta):
	pass

func next():
	if !character.aim_input.is_aim():
		return CrawlState.new(character)

	return self

func exit():
	pass
