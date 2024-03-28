class_name PlayerCharacterContent

var character
var camera
var canvas = CanvasLayer.new()
var gun_ui_aim_system_prefab

#var character_input_prefab = preload("res://prefabs/ui/input/ui_character_input.tscn")
#var gun_input_prefab = preload("res://prefabs/ui/input/ui_gun_input.tscn")

func _init(_character, _camera):
	character = _character
	character.add_child(canvas)
	camera = _camera
	gun_ui_aim_system_prefab = preload("res://prefabs/ui/sight/gun_ui_aim_system.tscn")

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

func create_character_aim_system():
	var aim_system = gun_ui_aim_system_prefab.instantiate()
	character.add_child(aim_system)
	aim_system.initialize(CharacterAimSystem.new(character, character.skeleton), camera, func(): return character.equipment.weapons.filter(func(weapon): return weapon.is_aim()).front())
	return aim_system
