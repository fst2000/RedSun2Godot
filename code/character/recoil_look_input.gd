class_name RecoilLookInput

var look_input
var weapon
var recoil_look_dir
var recoil_strength
var recoil_min
var recoil_max

func _init(_look_input, _weapon, _recoil_strength_multiplier = 1.0):
	look_input = _look_input
	weapon = _weapon
	recoil_look_dir = _look_input.look_direction()
	recoil_strength = weapon.recoil_strength * _recoil_strength_multiplier
	recoil_min = _weapon.recoil_min
	recoil_max = _weapon.recoil_max

func update(_delta):
	var look_dir = look_input.look_direction()
	if weapon.is_shoot():
		var recoil_aixs = Vector3(0.5 - randf(), 0.5 - randf(), 0.5 - randf()).slide(look_dir).normalized()
		var recoil_angle = recoil_strength * look_dir.angle_to(recoil_look_dir) + recoil_min
		recoil_angle = clamp(recoil_angle, recoil_min, recoil_max)
		recoil_look_dir = recoil_look_dir.rotated(recoil_aixs, recoil_angle)
	else:
		recoil_look_dir = lerp(recoil_look_dir, look_dir, _delta * 10)

func look_direction() -> Vector3:
	return recoil_look_dir
