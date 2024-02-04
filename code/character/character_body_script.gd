extends CharacterBody3D

var soldier
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

var weapon

@onready var walk_aim_tree = $WalkAimTree
@onready var crouch_aim_tree = $CrouchAimTree

func _ready():
	anim_player = $OnFootAnimPlayer
	anim_player_root = soldier.get_path()
	anim_player.set_root_node(anim_player_root)
	skeleton = soldier.get_node("Armature/Skeleton3D")
	spine_bone = soldier.get_node("SpineBone")
	weapon_bone = soldier.get_node("WeaponBone")
	state_machine = StateMachine.new(FloorState.new(self))

func _process(delta):
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
