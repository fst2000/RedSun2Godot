class_name Equipment

var character
var weapon_slots : Array[WeaponSlot]
var slot_nodes : Array[Node]
var current_weapon

func _init(_character, _slot_nodes : Array[Node]):
	slot_nodes = _slot_nodes
	character = _character

func take(weapon):
	var id = weapon.slot_id
	drop(id)
	weapon_slots.append(WeaponSlot.new(character, weapon, slot_nodes[id]))

func drop(id):
	for slot in weapon_slots:
		if slot.id == id:
			slot.drop()
			weapon_slots.erase(slot)
