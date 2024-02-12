class_name RecoilLookInput

var look_input
var weapon
var recoil_angle = 0.0
var recoil_axis = Vector3.UP
var recoil_strength
var recoil_min
var start_shoot = false
var recoil_timer

func _init(_look_input, _weapon):
	look_input = _look_input
	weapon = _weapon
	recoil_strength = weapon.recoil_strength
	recoil_min = _weapon.recoil_min

func look_direction() -> Vector3:
	var look_dir = look_input.look_direction()
	if weapon.is_shoot():
		if !start_shoot:
			recoil_timer = Stopwatch.new()
			start_shoot = true
			var random = RandomNumberGenerator.new()
			recoil_angle = clamp(random.randf() * recoil_timer.get_time(), recoil_min, 1) * recoil_strength
			recoil_axis = Vector3(0.5 - random.randf(), 0.5 - random.randf(), 0.5 - random.randf())
	else:
		start_shoot = false
	var recoil_axis_slide = recoil_axis.slide(look_dir).normalized()
	var recoil_look_dir = look_dir.rotated(recoil_axis_slide, recoil_angle)
	return recoil_look_dir
