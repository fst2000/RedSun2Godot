class_name CharacterInput

var move_input
var look_input

func _init(_move_input, _look_input):
	move_input = _move_input
	look_input = _look_input

func move_direction():
	return move_input.move_direction()

func look_direction():
	return look_input.look_direction()

func is_crawl():
	return move_input.is_crawl()

func is_crouch():
	return move_input.is_crouch()
