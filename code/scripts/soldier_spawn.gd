extends Node
@export var character_body_prefab : PackedScene
@export var soldier_prefab : PackedScene
@export var controller : Script

func spawn():
	var character_body = character_body_prefab.instantiate()
	var soldier = soldier_prefab.instantiate()
	character_body.add_child(soldier)
	character_body.controller = controller.new(character_body)
	get_tree().current_scene.add_child(character_body)
