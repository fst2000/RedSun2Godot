class_name TransportHitArea
extends Area3D

@export var transport : Node3D


func _physics_process(_delta):
	for body in get_overlapping_bodies():
		hit_action(body)

func hit_action(body):
	body.transport_hit_action(transport)
