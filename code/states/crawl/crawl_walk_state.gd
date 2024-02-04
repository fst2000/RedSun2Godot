class_name CrawlWalkState

var character

func _init(_character):
	character = _character
	character.anim_player.play("crawl")

func update(_delta): pass

func next():
	var move_strength = character.move_input.move_direction().length()
	if move_strength <= 0.01:
		return CrawlIdleState.new(character)

	return self

func exit(): pass
