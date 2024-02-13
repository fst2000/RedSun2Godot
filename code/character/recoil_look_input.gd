class_name RecoilLookInput

var look_input
var weapon
var recoil_angle = 0.0
var recoil_axis = Vector3.UP
var recoil_strength
var recoil_min
var recoil_timer = Stopwatch.new()
var start_timer
var prev_call_time = 0.0
var additive_recoil = 0.0

func _init(_look_input, _weapon):
	look_input = _look_input
	weapon = _weapon
	recoil_strength = weapon.recoil_strength
	recoil_min = _weapon.recoil_min
	start_timer = Stopwatch.new()

func look_direction() -> Vector3:
	var time = start_timer.get_time()
	var delta = time - prev_call_time
	prev_call_time = time
	var look_dir = look_input.look_direction()
	if weapon.is_shoot():
		additive_recoil += delta * recoil_strength * 1000
		recoil_timer = Stopwatch.new()
		var random = RandomNumberGenerator.new()
		recoil_angle = clamp(random.randf(), recoil_min, 1) * recoil_strength
		recoil_axis = Vector3(0.5 - random.randf(), 0.5 - random.randf(), 0.5 - random.randf())
	else:
		additive_recoil -= delta * recoil_strength * 300
	additive_recoil = clamp(additive_recoil, 0, 4)
	var recoil_axis_slide = recoil_axis.slide(look_dir).normalized()
	var recoil_mul = clamp(recoil_strength - recoil_timer.get_time(), 0, 1) * (1 + additive_recoil)
	var recoil_look_dir = look_dir.rotated(recoil_axis_slide, recoil_angle * recoil_mul)
	return recoil_look_dir
