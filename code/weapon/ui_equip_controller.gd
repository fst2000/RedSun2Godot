class_name UIEquipController
extends CanvasLayer

var equipment
var slots : Dictionary #key: weapon, value: slot_button
var slots_queue : Dictionary #key: weapon, value: slot_button

func _init(_character):
	_character.add_child(self)
	equipment = _character.equipment
	equipment.weapons.all(func(w): take(w))

func weapon_detection_action(weapon):
	add_in_queue(weapon)

func weapon_undetection_action(weapon):
	remove_from_queue(weapon)

func add_in_queue(weapon):
	var weapon_slot = weapon.weapon_slot.instantiate()
	add_child(weapon_slot)
	weapon_slot.initialize(
		func():
			equipment.take(weapon),
		func():
			var window = get_window()
			var screen_size = window.size / window.get_final_transform().get_scale().x
			var id = weapon.slot_id
			var weapon_key_index = slots_queue.keys().filter(func(w): return w.slot_id == weapon.slot_id).find(weapon)
			return Vector2(screen_size.x * 0.5 + id * 32 * weapon_slot.scale.x, screen_size.y * 0.9 - (weapon_key_index + 1) * 16 * weapon_slot.scale.y))
	slots_queue.merge({weapon : weapon_slot})

func remove_from_queue(weapon):
		var remove_slot = slots_queue.get(weapon)
		if remove_slot: remove_slot.queue_free()
		slots_queue.erase(weapon)

func _process(_delta):
	var slot_weapons = slots.keys()
	var take_weapons = equipment.weapons.filter(func(w): return !slot_weapons.has(w))
	var drop_weapons = slot_weapons.filter(func(w): return !equipment.weapons.has(w))
	for weapon in take_weapons: take(weapon)
	
	for weapon in drop_weapons:
		slots.get(weapon).queue_free()
		slots.erase(weapon)
	
func take(weapon):
	var weapon_slot = weapon.weapon_slot.instantiate()
	add_child(weapon_slot)
	slots.merge({weapon : weapon_slot})
	var id = weapon.slot_id
	weapon_slot.initialize(
		func():
			if weapon.is_armed:
				equipment.disarm(weapon)
			else:
				equipment.arm(weapon),
		func():
			var window = get_window()
			var screen_size = window.size / window.get_final_transform().get_scale().x
			return Vector2(screen_size.x * 0.5 + id * 32 * weapon_slot.scale.x, screen_size.y * 0.9))
	
func close():
	queue_free()
