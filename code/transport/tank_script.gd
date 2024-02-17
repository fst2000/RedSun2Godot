extends RigidBody3D

var update_event = UpdateEvent.new()
var wheels : Array[Wheel]
var engine_l : WheelsEngine
var engine_r : WheelsEngine
var tank_input
@export var transport_slot : PackedScene
@export var wheel_bones : Array[Node3D]
@export var engine_force = 20.0

func _ready():
	for b in wheel_bones:
		wheels.append(Wheel.new(self, b, b.get_node("RayCast3D"), 8, 5, 50))
	engine_l = WheelsEngine.new(
		wheels.filter(func(wheel): return wheel.wheel_node.name.contains("wheel_l")),
		30, 30)
	engine_r = WheelsEngine.new(
		wheels.filter(func(wheel): return wheel.wheel_node.name.contains("wheel_r")),
		30, 30)

func _physics_process(delta):
	for wheel in wheels:
		wheel.update(delta)
	
	if tank_input:
		engine_l.add_force(tank_input.engine_l_input() * engine_force)
		engine_r.add_force(tank_input.engine_r_input() * engine_force)

func get_in_action(_character):
	tank_input = _character.create_tank_input(self)
	
func get_out_action(_character):
	tank_input = null

func build_camera_controller(camera):
	return TankCameraController.new(camera, self)


func _on_detect_area_body_entered(body):
	body.transport_detection_action(self)
