class_name PlayerTransportController
extends CanvasLayer

var player
var camera
var detection_slot
var transport_slot

func _init(_player, _camera):
	player = _player
	camera = _camera
	player.add_child(self)

func transport_detection_action(transport):
	detection_slot = transport.transport_slot.instantiate()
	add_child(detection_slot)
	detection_slot.initialize(
		func():
			get_in(transport),
		func():
			var screen_size = get_window().size
			return Vector2(screen_size.x * 0.5, screen_size.y * 0.1))

func transport_undetection_action(_transport):
	detection_slot.queue_free()

func get_in(transport):
	transport_slot = transport.transport_slot.instantiate()
	add_child(transport_slot)
	transport_slot.initialize(
		func():
			get_out(transport)
			transport_slot.queue_free(),
		func():
			var screen_size = get_window().size
			return Vector2(screen_size.x * 0.5, screen_size.y * 0.1))
	transport.let_in_action(player)
	camera.switch(transport)

func get_out(transport):
	transport.let_out_action(player)
	camera.switch(player)
