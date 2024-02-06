extends Node3D

@export var skeleton : Skeleton3D
@export var bone_id : int

func _process(_delta):
	var bone_transform = skeleton.get_bone_global_pose(bone_id)
	var bone_position = bone_transform.origin
	var bone_quaternion = bone_transform.basis.get_rotation_quaternion()
	var bone_global_position = skeleton.to_global(bone_position)
	global_position = bone_global_position
	quaternion = bone_quaternion
