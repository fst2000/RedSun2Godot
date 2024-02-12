class_name Equipment

var character
var weapons : Array
var slot_nodes : Array[Node]

func _init(_character, _slot_nodes : Array[Node]):
	slot_nodes = _slot_nodes
	character = _character

func arm(weapon):
	var armed_weapons = character.weapon_bone.get_children()
	for w in armed_weapons: disarm(w)
	weapon.reparent(character.weapon_bone)
	weapon.position = Vector3.ZERO
	weapon.rotation = Vector3.ZERO
	weapon.arm_action()

func disarm(weapon):
	weapon.reparent(slot_nodes[weapon.slot_id])
	weapon.position = Vector3.ZERO
	weapon.rotation = Vector3.ZERO
	weapon.disarm_action()

func take(weapon):
	var weapons_at_id = weapons.filter(func(w): return w.slot_id == weapon.slot_id)
	for w in weapons_at_id:
		drop(w)
	weapon.reparent(slot_nodes[weapon.slot_id])
	weapon.position = Vector3.ZERO
	weapon.rotation = Vector3.ZERO
	weapon.take_action(character)
	weapons.append(weapon)
	

func drop(weapon):
	weapon.reparent(character.get_tree().get_current_scene())
	weapon.drop_action(character)
	weapons.erase(weapon)
