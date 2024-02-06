class_name CharacterAimSystem

var character
var skeleton : Skeleton3D
func _init(_characrer, _skeleton, _spine_bone : BoneAttachment3D):
	character = _characrer
	skeleton = _skeleton

func aim(direction : Vector3):
	var spine_transform = skeleton.get_bone_global_pose_no_override(2)
	var spine_quaternion = spine_transform.basis.get_rotation_quaternion()
	var forward = Vector3(0,0,1)
	var spine_look_direction = (character.quaternion.inverse() * direction).normalized()
	var spine_aim_quaternion = Quaternion(forward, spine_look_direction)
	spine_transform.basis = Basis(spine_aim_quaternion * spine_quaternion)
	skeleton.set_bone_global_pose_override(2, spine_transform, 1, true)

func reset():
	skeleton.clear_bones_global_pose_override()
