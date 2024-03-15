extends RigidBody3D

@export var bullet_prefab : PackedScene
@export var weapon_slot : PackedScene
@export var ui_prefab : PackedScene
@export var slot_id := 0
@export var bullet_damage = 50.0
@export var bullet_impulse = 5.0
@export var bullet_speed := 300.0
@export var bullet_life_time = 3.0
@export var bullets_per_second := 30
@export var bullets_capacity : int
@export var recoil_time = 0.05
@export var recoil_min = 0.1
@export var recoil_max = 0.5
@export var recoil_strength = 1.0
@onready var fire_rate = 1.0 / bullets_per_second
@onready var anim_player = $AnimPlayer
@onready var fire_point = $FirePoint
@onready var collision = $CollisionShape3D
@onready var weapon_input = EmptyGunInput.new()
@onready var weapon_state_machine = StateMachine.new(UnarmedState.new(self))
@onready var detect_area = $DetectArea
@onready var character_detector = AreaBodyDetector.new(
	detect_area,
	func(body): body.weapon_detection_action(self),
	func(_body): pass,
	func(body): body.weapon_undetection_action(self))
@onready var bullets_count = bullets_capacity
var character

var is_equipped = false
var is_armed = false
var timer = 0.0

func _process(_delta):
	timer += _delta
	weapon_input.update(_delta)
	weapon_state_machine.update(_delta)
	if weapon_input.is_drop():
		character.drop_weapon(self)
		drop_action(character)

func _physics_process(_delta):
	character_detector.update(_delta)

func shoot():
	if timer >= fire_rate && bullets_count > 0:
		bullets_count -= 1
		var bullet = bullet_prefab.instantiate()
		get_tree().current_scene.add_child(bullet)
		bullet.initialize(fire_point, bullet_damage, bullet_impulse, bullet_speed, bullet_life_time)
		timer = 0.0

func reload():
	bullets_count = bullets_capacity

func arm_action():
	is_armed = true
	weapon_input = character.create_gun_input(self)

func disarm_action():
	is_armed = false
	weapon_input.close()
	weapon_input = EmptyGunInput.new()

func take_action(_character):
	detect_area.monitoring = false
	is_equipped = true
	freeze = true
	collision.disabled = true
	anim_player.set_root_node(_character.anim_player_root)
	character = _character

func drop_action(_character):
	detect_area.monitoring = true
	is_equipped = false
	freeze = false
	collision.disabled = false
	anim_player.stop()
	anim_player.set_root_node("")
	reparent(_character.get_tree().current_scene)

func is_aim():
	return weapon_input.is_aim() && is_armed

func is_shoot():
	return weapon_input.is_shoot() && timer >= fire_rate && bullets_count > 0

func is_reload():
	return weapon_input.is_reload() && is_armed
