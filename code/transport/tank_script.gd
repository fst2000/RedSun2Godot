extends RigidBody3D

@export var wheel_bones : Array[Node3D]
var wheels : Array[Wheel]

func _ready():
	for b in wheel_bones:
		wheels.append(Wheel.new(self, b, b.get_node("RayCast3D"), 8))

func _physics_process(delta):
	for wheel in wheels:
		wheel.update(delta)
		
	if Input.is_action_just_pressed("jump"):
		apply_force(Vector3(0,1000,0) * mass)
