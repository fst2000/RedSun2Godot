class_name AimCrawlState

var weapon
var character
var look_input

func _init(_weapon):
	weapon = _weapon
	character = weapon.character
	weapon.anim_player.play("aim_crawl")
	look_input = RecoilLookInput.new(ClampLookInput.new(character.character_input, character, 15), weapon, 0.1)

func update(_delta):
	look_input.update(_delta)
	character.aim_system.aim(look_input.look_direction())

func next():
	if !weapon.character.is_crawl():
		return AimStandState.new(weapon)

	return self

func exit():
	pass
