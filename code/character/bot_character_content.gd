class_name BotCharacterContent

var character
func _init(_character):
	character = _character

func create_equip_controller():
	return BotEquipController.new()

func create_transport_controller():
	return BotTransportController.new()

func create_character_input():
	
	return BotCharacterInput.new(character)

func create_tank_input(tank):
	return EmptyTankInput.new(tank)

func create_gun_input(_gun):
	return EmptyGunInput.new()
