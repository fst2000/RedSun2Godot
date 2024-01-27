extends Node

@export var wheel_bones : Array[Node3D]
var wheels : Array[Wheel]

func _ready():
	for b in wheel_bones:
		wheels.append(Wheel.new(self, b, b.get_node("RayCast3D")))

func _physics_process(delta):
	for wheel in wheels:
		wheel.update(delta)
