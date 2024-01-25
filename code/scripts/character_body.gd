extends CharacterBody3D

var controller
var soldier

func _ready():
	pass

func _physics_process(delta):
	velocity = controller.move_direction() * 5 
	move_and_slide()
