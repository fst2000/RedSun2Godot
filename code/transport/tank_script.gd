extends RigidBody3D



var wheels : Array[Wheel]
var engine_l : WheelsEngine
var engine_r : WheelsEngine
var tank_input = EmptyTankInput.new(self)
var recoil_timer = Stopwatch.new()

@export var transport_slot : PackedScene
@export var shell_prefab : PackedScene
@export var sparks_particles_prefab : PackedScene
@export var wheel_bones : Array[Node3D]
@export var engine_force = 20.0
@export var shell_speed = 600.0
@export var shell_life_time = 5.0
@export var recoil_time = 3.0
@export var turret : Node3D
@export var gun : Node3D

@onready var tank_exit = $TankExit
@onready var detect_area = $DetectArea
@onready var character_detector = AreaBodyDetector.new(
	detect_area,
	func(body): body.transport_detection_action(self),
	func(_body): pass,
	func(body): body.transport_undetection_action(self))

@onready var fire_point = $T34/T34_Tower/T34_Gun/FirePoint
@onready var aim_system = TankAimSystem.new(self, turret, gun, -15, 15)
func _ready():
	angular_damp = 1
	for b in wheel_bones:
		wheels.append(Wheel.new(self, b, b.get_node("RayCast3D"), 8, 5, 50))
	engine_l = WheelsEngine.new(
		wheels.filter(func(wheel): return wheel.wheel_node.name.contains("wheel_l")),
		30, 30)
	engine_r = WheelsEngine.new(
		wheels.filter(func(wheel): return wheel.wheel_node.name.contains("wheel_r")),
		30, 30)

func _process(_delta):
	tank_input.update(_delta)

func _physics_process(delta):
	character_detector.update(delta)
	get_colliding_bodies().all(
		func(body):
			if linear_velocity.length() > 3:
				if body.has_method("transport_hit_action"):
					body.transport_hit_action(self))
	for wheel in wheels:
		wheel.update(delta)
	aim_system.aim(tank_input.look_direction())
	engine_l.add_force(tank_input.engine_l_input() * engine_force)
	engine_r.add_force(tank_input.engine_r_input() * engine_force)

func shoot():
	if recoil_timer.get_time() > recoil_time:
		recoil_timer = Stopwatch.new()
		var shell = shell_prefab.instantiate()
		get_tree().current_scene.add_child(shell)
		shell.initialize(fire_point, shell_speed, shell_life_time)
		apply_force(-gun.global_basis.z * 50 * mass, gun.global_position - global_position)

func get_in_action(_character):
	tank_input = _character.create_tank_input(self)
	_character.character_input.close()
	_character.character_input = EmptyCharacterInput.new()
	_character.equip_controller.close()
	_character.equip_controller = EmptyEquipController.new()
	_character.reparent(self)
	_character.position = Vector3.ZERO
	_character.visible = false
	_character.unshape()
	
func get_out_action(_character):
	_character.character_input = _character.create_character_input()
	_character.equip_controller = _character.create_equip_controller()
	tank_input = EmptyTankInput.new(self)
	_character.reparent(get_tree().current_scene)
	_character.global_position = tank_exit.global_position
	_character.visible = true
	_character.unshape()

func create_camera_controller(camera):
	return TankCameraController.new(camera, self)


func is_detecting(character):
	return detect_area.overlaps_body(character)

func bullet_hit_action(bullet, point, normal):
	var sparks_particles = sparks_particles_prefab.instantiate()
	add_child(sparks_particles)
	sparks_particles.global_position = point
	sparks_particles.quaternion = Quaternion(Vector3(0,0,1), normal)
	bullet.queue_free()
