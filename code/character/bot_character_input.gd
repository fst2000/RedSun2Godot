class_name BotCharacterInput

var move_input
var look_input

func _init(_bot):
	look_input = FuncLookInput.new(func(): return _bot.global_basis.z)
	move_input = BotMoveInput.new(_bot, ViewTargetDefiner.new(_bot, look_input, 60, 50))

func update(_delta):
	look_input.update(_delta)
	move_input.update(_delta)

func move_direction():
	return move_input.move_direction()

func look_direction():
	return look_input.look_direction()

func is_crawl():
	return move_input.is_crawl()

func is_crouch():
	return move_input.is_crouch()

func close():
	look_input.close()
	move_input.close()
