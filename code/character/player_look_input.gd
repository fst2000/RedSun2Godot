class_name PlayerLookInput

var character
var slide_input
var look_dir : Vector3

func _init(_character, _slide_input, _update_event : UpdateEvent):
	character = _character
	slide_input = _slide_input
	_update_event.add(update)
	look_dir = character.global_basis.z
	

func update(_delta):
	var slide_velocity = slide_input.velocity()
	look_dir = look_dir.rotated(character.global_basis.y, -slide_velocity.x * _delta)
	look_dir = look_dir.rotated(character.global_basis.y.cross(look_dir).normalized(), slide_velocity.y * _delta)

func look_direction():
	return look_dir
