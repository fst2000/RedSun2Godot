class_name PCGunInput

func update(_delta):
	pass

func close():
	pass

func is_aim():
	return Input.is_action_pressed("aim")

func is_shoot():
	return Input.is_action_pressed("fire")

func is_reload():
	return Input.is_action_pressed("reload")

func is_drop():
	return Input.is_action_pressed("drop")
