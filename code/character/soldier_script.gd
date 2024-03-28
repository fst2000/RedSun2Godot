extends CharacterBody3D

var content
var body

var equipment
var equip_controller
var transport_controller

var character_input
var aim_system
var state_machine

var anim_player
var skeleton
var spine_bone
var weapon_bone
var anim_player_root

@export var blood_particles_prefab : PackedScene

@onready var stand_check_ray = $StandCheckRay
@onready var crouch_check_ray = $CrouchCheckRay

@onready var stand_shape = $StandShape
@onready var crouch_shape = $CrouchShape
@onready var crawl_shape = $CrawlShape

var hp = 100

var gravity = 10

var is_in_transport = false

func _ready():
	body.character = self
	equipment = Equipment.new(self, body.get_node("SlotNodes").get_children())
	anim_player = $OnFootAnimPlayer
	anim_player_root = body.get_path()
	anim_player.set_root_node(anim_player_root)
	skeleton = body.get_node("Armature/Skeleton3D")
	weapon_bone = body.get_node("WeaponBone")
	aim_system = content.create_character_aim_system()
	
	equip_controller = content.create_equip_controller()
	transport_controller = content.create_transport_controller()
	character_input = content.create_character_input()
	
	state_machine = StateMachine.new(FloorState.new(self))

func _process(delta):
	character_input.update(delta)
	state_machine.update(delta)

func look_at_direction(direction : Vector3, axis := Vector3.UP):
	direction = direction.slide(Vector3.UP).normalized()
	if direction.length() > 0.1:
		look_at(global_position - direction, axis)

func move(direction):
	velocity.x = direction.x
	velocity.z = direction.z

func fall(delta):
	velocity.y -= gravity * delta
	move_and_slide()

func damage(value):
	hp -= value
	hp = clamp(hp, 0, 100)

func die():
	skeleton.physical_bones_start_simulation()
	unshape()
	character_input = EmptyCharacterInput.new()
	equip_controller = EmptyEquipController.new()
	equipment.weapons.all(func(w): equipment.drop(w))

func unshape():
	stand_shape.set_disabled(true)
	crouch_shape.set_disabled(true)
	crawl_shape.set_disabled(true)

func shape_stand():
	stand_shape.set_disabled(false)
	crouch_shape.set_disabled(true)
	crawl_shape.set_disabled(true)

func shape_crouch():
	stand_shape.set_disabled(true)
	crouch_shape.set_disabled(false)
	crawl_shape.set_disabled(true)

func shape_crawl():
	stand_shape.set_disabled(true)
	crouch_shape.set_disabled(true)
	crawl_shape.set_disabled(false)

func drop_weapon(weapon):
	skeleton.reset_bone_poses()
	equipment.drop(weapon)

func move_direction():
	return character_input.move_direction()

func look_direction():
	return character_input.look_direction()

func can_stand():
	return !stand_check_ray.is_colliding()

func can_crouch():
	return !crouch_check_ray.is_colliding()
func is_crouch():
	return character_input.is_crouch()

func is_crawl():
	return character_input.is_crawl()

func is_dead():
	return hp <= 0

func is_aim(): return equipment.weapons.any(func(weapon): return weapon.is_aim())

func is_reload(): return equipment.weapons.any(func(weapon): return weapon.is_reload())

func get_in_action(_transport):
	is_in_transport = true
	character_input.close()
	character_input = EmptyCharacterInput.new()
	equip_controller.close()
	equip_controller = EmptyEquipController.new()
	unshape()
	skeleton.animate_physical_bones = false

func get_out_action(_transport):
	is_in_transport = false
	character_input = create_character_input()
	equip_controller = create_equip_controller()
	skeleton.animate_physical_bones = true

func transport_hit_action(_transport):
	var hit_damage = (_transport.get_linear_velocity() - velocity).length()
	if hit_damage > 6:
		damage(hit_damage)

func weapon_detection_action(weapon):
	equip_controller.weapon_detection_action(weapon)

func weapon_undetection_action(weapon):
	equip_controller.weapon_undetection_action(weapon)

func transport_detection_action(transport):
	transport_controller.transport_detection_action(transport)

func transport_undetection_action(transport):
	transport_controller.transport_undetection_action(transport)

func create_camera_controller(camera):
	return CharacterCameraController.new(self, camera, CharacterCameraInput.new(self))

func create_equip_controller():
	return content.create_equip_controller()

func create_character_input():
	return content.create_character_input()

func create_tank_input(tank):
	return content.create_tank_input(tank)

func create_gun_input(gun):
	return content.create_gun_input(gun)
