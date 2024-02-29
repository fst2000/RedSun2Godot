class_name PlayerTransportController
extends CanvasLayer

var player
var camera
var slot

func _init(_player, _camera):
	player = _player
	camera = _camera
	player.add_child(self)

func transport_detection_action(transport):
	slot = transport.transport_slot.instantiate()
	add_child(slot)
	slot.initialize(
		func(): get_in(transport),
		func():
			var screen_size = get_window().size
			return Vector2(screen_size.x * 0.5, screen_size.y * 0.1))

func transport_undetection_action(_transport):
	slot.queue_free()

func get_in(transport):
	transport.get_in_action(player)
	camera.switch(transport)

func get_out(transport):
	transport.get_out_action(player)
	camera.switch(player)
