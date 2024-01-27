class_name CrawlWalkState

var character

func _init(character):
	self.character = character
	character.anim_player.play("anim_crawl/crawl")

func update(delta): pass

func next():
	var move_strength = character.move_controller.move_direction().length()
	if move_strength <= 0.01:
		return CrawlIdleState.new(character)

	return self

func exit(): pass
