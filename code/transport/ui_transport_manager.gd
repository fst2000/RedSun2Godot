class_name UITransportManager
extends CanvasLayer

var player
var camera

func _init(_player, _camera):
	player = _player
	camera = _camera
	player.add_child(self)

func transport_detection_action(transport):
	var slot = transport.transport_slot.instantiate()
	add_child(slot)
	slot.initialize(
		transport,
		func(): get_in(transport))

func transport_undetection_action(_transport):
	pass

func get_in(transport):
	transport.get_in_action(player)
	camera.switch(transport)

func get_out(transport):
	transport.get_out_action(player)
	camera.switch(player)
