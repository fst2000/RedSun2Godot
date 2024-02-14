extends RigidBody3D

var wheels : Array[Wheel]
var engine_l : WheelsEngine
var engine_r : WheelsEngine
@export var wheel_bones : Array[Node3D]

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
		
	if Input.is_action_pressed("up"):
		engine_l.add_force(20)
		engine_r.add_force(20)
	
	if Input.is_action_pressed("down"):
		engine_l.add_force(-20)
		engine_r.add_force(-20)
	
	if Input.is_action_pressed("left"):
		engine_l.add_force(-20)
		engine_r.add_force(20)
		
	
	if Input.is_action_pressed("right"):
		engine_l.add_force(20)
		engine_r.add_force(-20)
		
func build_camera_controller(camera):
	return TankCameraController.new(camera)
