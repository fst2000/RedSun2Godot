class_name CrawlState

var character
var state_machine

func _init(_character):
	character = _character
	var crawl_state
	if character.is_aim(): crawl_state = WeaponCrawlState.new(character)
	else: crawl_state = CrawlIdleState.new(character)
	state_machine = StateMachine.new(crawl_state)

func update(delta):
	state_machine.update(delta)

func next():
	if !character.move_input.is_crawl():
		return CrouchState.new(character)
	
	if character.is_aim():
		character.anim_player.set_default_blend_time(0)
		return WeaponCrawlState.new(character)
	
	return self

func exit():
	state_machine.state.exit()
