class_name PlayerCharacterContent

var character
var camera

func _init(_character, _camera):
	character = _character
	camera = _camera

func create_equip_manager():
	return UIEquipManager.new(character)

func create_transport_manager():
	return UITransportManager.new(character, camera)

func create_look_input():
	return SlideLookInput.new(character, MouseInput.new(character), 60)

func create_move_input():
	return KeyboardMoveInput.new(character.look_input)

func create_tank_input(tank):
	return TankInput.new(tank, character.move_input, character.look_input, null)
