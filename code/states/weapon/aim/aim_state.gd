class_name AimState

var character
var weapon
var state_machine
var look_input

func _init(_character):
	character = _character
	weapon = character.weapon
	var aim_state
	if character.move_input.is_crawl(): aim_state = AimCrawlState.new(character)
	else: aim_state = AimStandState.new(character)
	state_machine = StateMachine.new(aim_state)
	look_input = RecoilLookInput.new(character.look_input, weapon.weapon_input, weapon.recoil_time, weapon.recoil_strength)

func update(_delta):
	state_machine.update(_delta)
	character.aim_system.aim(look_input.look_direction())
	if weapon.weapon_input.is_shoot():
		weapon.shoot()

func next():
	if !weapon.weapon_input.is_aim():
		return ArmedState.new(character)
	
	if !weapon:
		return UnarmedState.new(character)

	return self

func exit():
	character.aim_system.reset()
