extends Node3D

@export var skeleton : Skeleton3D
@export var bone_id : int
@export var custom_rotation : Vector3
@export var offset : Vector3

func _process(_delta):
	var bone_transform = skeleton.get_bone_global_pose(bone_id)
	var bone_quaternion = bone_transform.basis.get_rotation_quaternion() * Quaternion.from_euler(custom_rotation * PI / 180)
	var bone_position = bone_transform.origin + bone_quaternion * offset
	var bone_global_position = skeleton.to_global(bone_position)
	global_position = bone_global_position
	quaternion = bone_quaternion
