class_name CrawlIdleState

var character

func _init(character):
	self.character = character
	character.anim_player.play("anim_crawl/crawl_idle")

func update(delta):
	pass

func next():
	if character.controller.move_direction().length() > 0:
		return CrawlWalkState.new(character)
	return self

func exit(): pass
