extends Node3D

@export var particles : Node3D

func _ready():
	particles.set_one_shot(true)
	particles.set_emitting(true)

func _process(_delta):
	if !particles.is_emitting():
		queue_free()
