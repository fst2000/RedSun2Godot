class_name TankAimSystem

var tank : Node3D
var turret
var gun
var min_angle
var max_angle

func _init(_tank, _turret, _gun, _min_angle : float, _max_angle : float):
	tank = _tank
	turret = _turret
	gun = _gun
	min_angle = _min_angle * PI / 180.0
	max_angle = _max_angle * PI / 180.0

func aim(direction : Vector3):
	var aim_speed = 0.05
	var tank_up = tank.global_basis.y
	var turret_left = turret.global_basis.x
	var turret_forward = turret.global_basis.z
	turret.global_rotate(tank_up, clamp(turret_forward.signed_angle_to(direction.slide(tank_up), tank_up), -aim_speed, aim_speed))
	gun.rotation.y = 0
	gun.rotation.z = 0
	gun.rotation.x = turret_forward.signed_angle_to(direction.slide(turret_left), turret_left)
	gun.rotation.x = clamp(gun.rotation.x, min_angle, max_angle)
