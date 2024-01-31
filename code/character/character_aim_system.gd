class_name CharacterAimSystem

var character
var skeleton : Skeleton3D
var spine_bone : BoneAttachment3D
var spine_bone_id

func _init(_characrer, _skeleton, _spine_bone : BoneAttachment3D):
	character = _characrer
	skeleton = _skeleton
	spine_bone = _spine_bone
	spine_bone_id = _spine_bone.bone_idx

func aim(direction : Vector3):
	spine_bone.override_pose = true
	var character_forward = character.global_basis.z
	var spine_quaternion = spine_bone.quaternion
	var direction_quaternion = Quaternion(spine_bone.global_basis.z, direction.normalized())
	spine_bone.quaternion = direction_quaternion
	
