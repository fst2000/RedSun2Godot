extends CharacterBody3D

var soldier
var camera
var move_controller
var camera_controller
var state_machine
var anim_player

func _ready():
	anim_player = $OnFootAnimPlayer
	state_machine = StateMachine.new(StandState.new(self))

func _process(delta):
	state_machine.update(delta)
	move_and_slide()

func look_at_direction(direction : Vector3):
	if direction.length() > 0.1:
		look_at(global_position - direction)

func move(direction):
	velocity.x = direction.x
	velocity.z = direction.z
