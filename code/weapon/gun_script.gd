extends RigidBody3D

@export var bullet_prefab : PackedScene
@export var bullet_speed := 300.0
@export var bullets_per_second := 30
@export var custom_rotation_degrees := Vector3.ZERO
@onready var fire_rate = 1.0 / bullets_per_second
@onready var anim_player = $AnimPlayer
@onready var fire_point = $FirePoint
@onready var collision = $CollisionShape3D
@onready var weapon_input = KeyboardGunInput.new()
@onready var state_machine = StateMachine.new(UnequippedState.new(self))
var aim_controller
var is_equipped = false

func _process(delta):
	state_machine.update(delta)

func shoot():
	var bullet = bullet_prefab.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = fire_point.global_position
	var velocity = global_basis.z * bullet_speed
	bullet.velocity = velocity
	bullet.look_at(bullet.global_position - velocity)

func take(character):
	is_equipped = true
	freeze = true
	aim_controller = character.aim_controller
	reparent(character.weapon_bone)
	global_position = character.weapon_bone.global_position
	rotation_degrees = custom_rotation_degrees
	anim_player.set_root_node(character.anim_player_root)

func drop(character):
	is_equipped = false
	freeze = false
	reparent(character.get_tree().current_scene)
	anim_player.stop()
	character.skeleton.reset_bone_poses()
