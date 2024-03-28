class_name BotSpawn
extends Node3D

@export var bot_prefab : PackedScene
@export var bot_body_prefab : PackedScene

func spawn() -> Node3D:
	var bot = bot_prefab.instantiate()
	var bot_body = bot_body_prefab.instantiate()
	bot.content = BotCharacterContent.new(bot)
	bot.body = bot_body
	bot.add_child(bot_body)
	get_tree().current_scene.add_child(bot)
	
	bot.global_position = global_position
	return bot
