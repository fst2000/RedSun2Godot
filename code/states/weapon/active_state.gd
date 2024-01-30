class_name ActiveState

var weapon
var state_machine

func _init(weapon):
	self.weapon = weapon
	state_machine = StateMachine.new(ArmedState.new(weapon))

func update(delta):
	pass

func next():
	return self

func exit():
	weapon.anim_player.stop()
