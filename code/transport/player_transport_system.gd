class_name PlayerTransportSystem

var player
var camera

func _init(_player, _camera):
	player = _player
	camera = _camera

func get_in(transport):
	transport.get_in_action(player)
	camera.switch(transport)

func get_out(transport):
	transport.get_out_action(player)
	camera.switch(player)
