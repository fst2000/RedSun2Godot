class_name RecoilLookInput

var look_input
var weapon_input
var recoil_angle = 0.0
var recoil_axis = Vector3.UP
var recoil_time
var recoil_strength

func _init(_look_input, _weapon_input, _recoil_time, _recoil_strength):
	look_input = _look_input
	weapon_input = _weapon_input
	recoil_time = _recoil_time
	recoil_strength = _recoil_strength

func look_direction() -> Vector3:
	if weapon_input.is_shoot():
		var random = RandomNumberGenerator.new()
		recoil_angle = random.randf()
		recoil_axis = Vector3(0.5 - random.randf(), 0.5 - random.randf(), 0.5 - random.randf())
	var look_dir = look_input.look_direction()
	var recoil_axis_slide = recoil_axis.slide(look_dir).normalized()
	var recoil_look_dir = look_dir.rotated(recoil_axis_slide, recoil_angle * recoil_strength)
	return recoil_look_dir
