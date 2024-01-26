extends Node3D

@export var character_body_prefab : PackedScene
@export var soldier_prefab : PackedScene
@export var controller_prefab : PackedScene

func spawn():
	var character_body = character_body_prefab.instantiate()
	var soldier = soldier_prefab.instantiate()
	var controller = controller_prefab.instantiate()

	character_body.add_child(soldier)
	character_body.add_child(controller)
	
	get_tree().current_scene.add_child(character_body)
	character_body.global_position = global_position
	character_body.spawn(soldier, controller)
