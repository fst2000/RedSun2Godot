extends RigidBody3D

@export var bullet_prefab : PackedScene
@export var slot_id := 0
@export var bullet_speed := 300.0
@export var bullets_per_second := 30
@export var recoil_time = 0.05
@export var recoil_min = 0.01
@export var recoil_strength = 0.1
@onready var fire_rate = 1.0 / bullets_per_second
@onready var anim_player = $AnimPlayer
@onready var fire_point = $FirePoint
@onready var collision = $CollisionShape3D
@onready var weapon_input = KeyboardGunInput.new()
@onready var weapon_state_machine = StateMachine.new(UnarmedState.new(self))

var character

var is_equipped = false
var is_armed = false
var timer = 0.0

func _process(_delta):
	timer += _delta
	weapon_state_machine.update(_delta)

func shoot():
	if timer >= fire_rate:
		var bullet = bullet_prefab.instantiate()
		get_tree().current_scene.add_child(bullet)
		bullet.global_position = fire_point.global_position
		var velocity = global_basis.z * bullet_speed
		bullet.velocity = velocity
		bullet.look_at(bullet.global_position - velocity)
		timer = 0.0

func arm_action():
	is_armed = true

func disarm_action():
	is_armed = false

func take_action(_character):
	is_equipped = true
	freeze = true
	collision.disabled = true
	anim_player.set_root_node(_character.anim_player_root)
	character = _character

func drop_action(_character):
	is_equipped = false
	disarm_action()
	freeze = false
	collision.disabled = false
	anim_player.stop()
	anim_player.set_root_node("")
	_character.skeleton.reset_bone_poses()

func is_aim():
	return weapon_input.is_aim() && is_armed

func is_shoot():
	return weapon_input.is_shoot()

func is_reload():
	return weapon_input.is_reload()
