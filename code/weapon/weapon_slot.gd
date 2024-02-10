class_name WeaponSlot

var id
var character
var weapon
var slot_node : Node

func _init(_character, _weapon, _slot_node : Node):
	character = _character
	weapon = _weapon
	id = weapon.slot_id
	slot_node = _slot_node
	weapon.take_action(character)
	weapon.reparent(slot_node)
	weapon.position = Vector3.ZERO
	weapon.rotation = Vector3.ZERO

func arm():
	weapon.arm_action()
	weapon.reparent(character.weapon_bone)
	weapon.position = Vector3.ZERO
	weapon.rotation = Vector3.ZERO

func disarm():
	weapon.disarm_action()
	weapon.reparent(slot_node)
	weapon.position = Vector3.ZERO
	weapon.rotation = Vector3.ZERO

func drop():
	weapon.drop_action(character)
	weapon.reparent(weapon.get_tree().get_current_scene())
