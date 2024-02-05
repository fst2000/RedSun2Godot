class_name AimState

var character
var weapon
var state_machine

func _init(_character):
	character = _character
	var aim_state
	if character.move_input.is_crawl(): aim_state = AimCrawlState.new(character)
	else: aim_state = AimStandState.new(character)
	state_machine = StateMachine.new(aim_state)

func update(_delta):
	state_machine.update(_delta)
	character.aim_system.aim(character.look_input.look_direction())

func next():
	if !character.weapon.weapon_input.is_aim():
		return ArmedState.new(character)
	
	if !character.weapon:
		return UnarmedState.new(character)

	return self

func exit():
	character.aim_system.reset()
