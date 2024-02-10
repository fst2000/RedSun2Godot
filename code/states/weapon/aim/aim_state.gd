class_name AimState

var character
var weapon
var state_machine
var look_input

func _init(_weapon):
	weapon = _weapon
	character = weapon.character
	var aim_state
	if character.move_input.is_crawl(): aim_state = AimCrawlState.new(weapon)
	else: aim_state = AimStandState.new(weapon)
	state_machine = StateMachine.new(aim_state)
	look_input = RecoilLookInput.new(character.look_input, weapon)

func update(_delta):
	state_machine.update(_delta)
	character.aim_system.aim(look_input.look_direction())
	if weapon.is_shoot():
		weapon.shoot()

func next():
	if !weapon.is_aim():
		return ArmedState.new(weapon)
	
	if !weapon.is_armed:
		return UnarmedState.new(weapon)

	return self

func exit():
	character.aim_system.reset()
	state_machine.state.exit()
