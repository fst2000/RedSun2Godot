extends CharacterBody3D

var controller
var soldier
var state_machine
var anim_player

func spawn(soldier, controller):
	self.soldier = soldier
	self.controller = controller
	anim_player = $OnFootAnimPlayer
	anim_player.set_root_node(soldier.get_path())
	state_machine = StateMachine.new(StandState.new(self))

func _process(delta):
	state_machine.update(delta)
	move_and_slide()

func look_at_direction(direction : Vector3):
	if direction.length() > 0.1:
		look_at(global_position - direction)
