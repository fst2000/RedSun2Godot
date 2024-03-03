class_name PlayerCharacterContent

var character
var camera
var canvas = CanvasLayer.new()


var character_input_prefab = preload("res://prefabs/ui/input/ui_character_input.tscn")
var gun_input_ui_prefab = preload("res://prefabs/ui/input/gun_input_ui.tscn")

func _init(_character, _camera):
	character = _character
	character.add_child(canvas)
	camera = _camera

func create_equip_controller():
	return UIEquipController.new(character)

func create_transport_controller():
	return PlayerTransportController.new(character, camera)

func create_character_input():
	var character_input = character_input_prefab.instantiate()
	character_input.initialize(character)
	return character_input

func create_tank_input(tank):
	return TankInput.new(tank, character.character_input, null)

func create_gun_input(gun):
	var gun_input = UIGunInput.new(gun_input_ui_prefab.instantiate(), gun)
	return gun_input
