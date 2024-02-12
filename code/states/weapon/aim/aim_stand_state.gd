class_name AimStandState

var weapon
var character
var look_input

func _init(_weapon):
	weapon = _weapon
	character = weapon.character
	weapon.anim_player.play("aim")
	look_input = RecoilLookInput.new(ClampLookInput.new(character.look_input, character, 60), weapon)

func update(_delta):
	character.aim_system.aim(look_input.look_direction())

func next():
	if weapon.character.move_input.is_crawl():
		return AimCrawlState.new(weapon)

	return self

func exit():
	pass
