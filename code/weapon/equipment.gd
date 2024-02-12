class_name Equipment

var character
var weapons : Array
var slot_nodes : Array[Node]

func _init(_character, _slot_nodes : Array[Node]):
	slot_nodes = _slot_nodes
	character = _character

func arm():
	pass

func disarm():
	pass

func take(weapon):
	var weapons_at_id = weapons.filter(func(w): return w.slot_id == weapon.slot_id)
	for w in weapons_at_id:
		drop(w)
	weapon.reparent(slot_nodes[weapon.slot_id])
	weapon.position = Vector3.ZERO
	weapon.rotation = Vector3.ZERO
	weapon.take_action(character)
	weapons.append(weapon)
	weapons.sort_custom(func(a, b): return a.slot_id < b.slot_id)
	

func drop(weapon):
	weapon.reparent(character.get_tree().get_current_scene())
	weapon.drop_action(character)
	weapons.erase(weapon)
	weapons.sort_custom(func(a, b): return a.slot_id < b.slot_id)
