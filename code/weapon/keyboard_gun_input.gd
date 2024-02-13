class_name KeyboardGunInput

func is_shoot():
	return Input.is_action_pressed("fire")

func is_aim():
	return Input.is_action_pressed("aim")

func is_reload():
	return Input.is_action_just_pressed("reload")
