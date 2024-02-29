class_name ReloadState

var weapon
var character
var state_machine

func _init(_weapon):
	weapon = _weapon
	character = weapon.character
	var state
	if character.is_crawl(): state = ReloadCrawlState.new(weapon)
	else: state = ReloadStandState.new(weapon)
	state_machine = StateMachine.new(state)

func update(_delta):
	state_machine.update(_delta)

func next():
	if !weapon.is_armed:
		return UnarmedState.new(weapon)
	
	if weapon.anim_player.current_animation_position >= (weapon.anim_player.current_animation_length - 0.05):
		weapon.reload()
		return ArmedState.new(weapon)
	
	return self

func exit():
	state_machine.state.exit()
