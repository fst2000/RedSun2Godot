class_name PCCharacterInput

var look_input
var move_input

var mouse_input

func _init(_character):
	mouse_input = MouseInput.new(_character)
	look_input = SlideLookInput.new(
			FuncLookInput.new(func(): return Vector3(0,0,1)),
			_character,
			mouse_input,
	1.0, 60.0)
	move_input = KeyboardMoveInput.new(look_input)

func update(_delta):
	look_input.update(_delta)
	move_input.update(_delta)

func close():
	look_input.close()
	move_input.close()
	mouse_input.close()

func look_direction():
	return look_input.look_direction()

func move_direction():
	return move_input.move_direction()

func is_crouch():
	return Input.is_action_pressed("crouch")

func is_crawl():
	return Input.is_action_pressed("crawl")
