class_name MultipleController

var controllers

func _init(_controllers):
	self.controllers = _controllers

func update(delta):
	for c in controllers:
		c.update(delta)
