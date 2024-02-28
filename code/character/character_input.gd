class_name CharacterInput

var look_input
var move_input

func _init(_look_input, _move_input):
	look_input = _look_input
	move_input = _move_input

func look_direction():
	return look_input.look_direction()

func move_direction():
	return move_input.move_direction()

func is_crouch():
	return move_input.is_crouch()

func is_crawl():
	return move_input.is_crawl()
