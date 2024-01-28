extends CharacterBody3D

var soldier
var move_controller
var camera_controller
var state_machine
var anim_player

var gravity = 10

func _ready():
	anim_player = $OnFootAnimPlayer
	anim_player.set_root_node(soldier.get_path())
	state_machine = StateMachine.new(FloorState.new(self))

func _process(delta):
	state_machine.update(delta)
	move_and_slide()

func look_at_direction(direction : Vector3):
	if direction.length() > 0.1:
		look_at(global_position - direction)

func move(direction):
	velocity.x = direction.x
	velocity.z = direction.z

func fall(delta):
	velocity.y -= gravity * delta
