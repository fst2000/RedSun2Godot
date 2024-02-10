extends CharacterBody3D

var soldier
var equipment

@onready var take_area = $TakeArea

var move_input
var look_input
var aim_system
var camera_controller
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
	state_machine = StateMachine.new(FloorState.new(self))

func _process(delta):
	state_machine.update(delta)
	move_and_slide()
	
	var weapons = take_area.get_overlapping_bodies()
	if weapons:
		if Input.is_action_just_pressed("take"):
			equipment.take(weapons.front())
	
	if Input.is_action_just_pressed("drop"):
			equipment.drop(0)

func look_at_direction(direction : Vector3, axis := Vector3.UP):
	direction = direction.slide(Vector3.UP).normalized()
	if direction.length() > 0.1:
		look_at(global_position - direction, axis)

func move(direction):
	velocity.x = direction.x
	velocity.z = direction.z

func fall(delta):
	velocity.y -= gravity * delta

func is_aim(): return false
