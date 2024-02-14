class_name WheelsEngine

var wheels : Array[Wheel]
var max_forward_torque
var max_back_torque

func _init(_wheels : Array, _max_forward_torque : float, _max_back_torque : float):
	wheels = _wheels
	max_forward_torque = _max_forward_torque
	max_back_torque = _max_back_torque

func add_force(force : float):
	for wheel in wheels:
		wheel.wheel_torque = clamp(wheel.wheel_torque + force, -max_back_torque, max_forward_torque)
