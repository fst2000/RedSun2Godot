class_name PlayerCharacterContent

var character
var camera
var canvas = CanvasLayer.new()


#var character_input_prefab = preload("res://prefabs/ui/input/ui_character_input.tscn")
#var gun_input_prefab = preload("res://prefabs/ui/input/ui_gun_input.tscn")

func _init(_character, _camera):
	character = _character
	character.add_child(canvas)
	camera = _camera

func create_equip_controller():
	return UIEquipController.new(character)

func create_transport_controller():
	return PlayerTransportController.new(character, camera)

func create_character_input():
	#var character_input = character_input_prefab.instantiate()
	#character_input.initialize(character)
	var character_input = PCCharacterInput.new(character)
	return character_input

func create_tank_input(tank):
	return PCTankInput.new(tank)

func create_gun_input(_gun):
	#var gun_input = gun_input_prefab.instantiate()
	#gun_input.initialize(gun)
	var gun_input = PCGunInput.new()
	return gun_input
