extends RigidBody3D

@export var bullet_prefab : PackedScene
@export var bullet_speed := 300
@export var custom_rotation_degrees := Vector3.ZERO
@onready var anim_player = $AnimPlayer
@onready var fire_point = $FirePoint
@onready var collision = $CollisionShape3D
func shoot():
	var bullet = bullet_prefab.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = fire_point.global_position
	var velocity = global_basis.z * bullet_speed
	bullet.velocity = velocity
	bullet.look_at(bullet.global_position - velocity)

func take(character):
	freeze = true
	reparent(character.weapon_bone)
	global_position = character.weapon_bone.global_position
	rotation_degrees = custom_rotation_degrees
	anim_player.set_root_node(character.anim_player_root)
	anim_player.play("anim_ppsh/aim")

func drop(character):
	freeze = false
	reparent(character.get_tree().current_scene)
	anim_player.stop()
	character.skeleton.reset_bone_poses()
