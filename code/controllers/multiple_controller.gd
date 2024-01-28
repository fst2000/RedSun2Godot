class_name MultipleController

var controllers

func _init(controllers):
	self.controllers = controllers

func update(delta):
	for c in controllers:
		c.update(delta)
