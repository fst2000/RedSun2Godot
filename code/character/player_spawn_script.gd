class_name PlayerSpawn
extends Node3D

@export var character_body_prefab : PackedScene
@export var soldier_prefab : PackedScene
@export var camera : Node3D

func spawn() -> Node3D:
	var character_body = character_body_prefab.instantiate()
	var soldier = soldier_prefab.instantiate()
	character_body.content = PlayerCharacterContent.new(character_body, camera)
	character_body.soldier = soldier
	character_body.add_child(soldier)
	get_tree().current_scene.add_child(character_body)
	
	character_body.global_position = global_position
	return character_body