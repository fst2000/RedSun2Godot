extends CharacterBody3D

var content
var soldier

var equipment
var equip_manager
var transport_manager

var move_input
var look_input
var aim_system
var state_machine

var anim_player
var skeleton
var spine_bone
var weapon_bone
var anim_player_root

var gravity = 10

func _ready():
	equipment = Equipment.new(self, soldier.get_node("SlotNodes").get_children())
	anim_player = $OnFootAnimPlayer
	anim_player_root = soldier.get_path()
	anim_player.set_root_node(anim_player_root)
	skeleton = soldier.get_node("Armature/Skeleton3D")
	weapon_bone = soldier.get_node("WeaponBone")
	aim_system = CharacterAimSystem.new(self, skeleton)
	
	equip_manager = content.create_equip_manager()
	transport_manager = content.create_transport_manager()
	look_input = content.create_look_input()
	move_input = content.create_move_input()
	
	
	state_machine = StateMachine.new(FloorState.new(self))

func _process(delta):
	look_input.update(delta)
	move_input.update(delta)
	state_machine.update(delta)
	move_and_slide()

func look_at_direction(direction : Vector3, axis := Vector3.UP):
	direction = direction.slide(Vector3.UP).normalized()
	if direction.length() > 0.1:
		look_at(global_position - direction, axis)

func move(direction):
	velocity.x = direction.x
	velocity.z = direction.z

func fall(delta):
	velocity.y -= gravity * delta

func is_aim(): return equipment.weapons.any(func(weapon): return weapon.is_aim())

func is_reload(): return equipment.weapons.any(func(weapon): return weapon.is_reload())

func weapon_detection_action(weapon):
	equip_manager.weapon_detection_action(weapon)

func weapon_undetection_action(weapon):
	equip_manager.weapon_undetection_action(weapon)

func transport_detection_action(transport):
	transport_manager.transport_detection_action(transport)

func transport_undetection_action(transport):
	transport_manager.transport_undetection_action(transport)

func create_camera_controller(camera):
	return CharacterCameraController.new(self, camera, CharacterCameraInput.new(self))

func create_tank_input(tank):
	return content.create_tank_input(tank)

func create_gun_input(gun):
	return content.create_gun_input(gun)
