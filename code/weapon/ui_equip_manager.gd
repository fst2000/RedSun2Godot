class_name UIEquipManager
extends CanvasLayer

var equipment
var slots : Array
var slots_queue : Array

func _init(_character):
	_character.add_child(self)
	equipment = _character.equipment

func weapon_detection_action(weapon):
	add_in_queue(weapon)

func add_in_queue(weapon):
	var weapon_slot = weapon.weapon_slot.instantiate()
	add_child(weapon_slot)
	weapon_slot.initialize(
		weapon,
		func():
			equipment.take(weapon)
			add(weapon)
			remove_from_queue(weapon)
			slots_queue_update_position(),
		func(): return false)
	slots_queue.append(weapon_slot)
	slots_queue_update_position()

func remove_from_queue(weapon):
	var remove_slots =  slots_queue.filter(func(slot): return slot.weapon == weapon)
	for slot in remove_slots:
		slot.queue_free()
		slots_queue.erase(slot)
	slots_queue_update_position()

func slots_queue_update_position():
	var screen_size = get_window().size
	var slot_count = 0
	for slot in slots_queue:
		var id = slot.weapon.slot_id
		slot.position = Vector2(screen_size.x * 0.5 + id * 50, screen_size.y * 0.9 - (slot_count + 1) * 30)
		slot_count += 1

func add(weapon):
	var weapon_slot = weapon.weapon_slot.instantiate()
	add_child(weapon_slot)
	slots.append(weapon_slot)
	var id = weapon.slot_id
	weapon_slot.initialize(
		weapon,
		func():
			equipment.arm(weapon),
		func(): return !weapon.is_equipped)
	var screen_size = get_window().size
	weapon_slot.position = Vector2(screen_size.x * 0.5 + id * 50, screen_size.y * 0.9)
