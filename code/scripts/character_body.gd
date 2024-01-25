extends CharacterBody3D

var controller = KeyboardController.new()
@export var soldier : Node3D

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
