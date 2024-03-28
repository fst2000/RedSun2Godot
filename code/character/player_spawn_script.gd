class_name PlayerSpawn
extends Node3D

@export var player_prefab : PackedScene
@export var player_body_prefab : PackedScene
@export var camera : Node3D

func spawn() -> Node3D:
	var player = player_prefab.instantiate()
	var player_body = player_body_prefab.instantiate()
	player.content = PlayerCharacterContent.new(player, camera)
	player.body = player_body
	player.add_child(player_body)
	get_tree().current_scene.add_child(player)
	
	player.global_position = global_position
	return player
