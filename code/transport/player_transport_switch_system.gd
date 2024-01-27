class_name PlayerTransportSwitchSystem

var player
var camera

func _init(player, camera):
	self.player = player
	self.camera = camera

func get_in(transport):
	camera.switch(transport)

func get_out(transport):
	camera.switch(player)
