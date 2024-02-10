class_name EmptyWeapon

func arm_action(): pass

func disarm_action(): pass

func shoot(): pass

func equip_action(_character): pass

func drop_action(_character): pass

func is_aim(): return false

func is_shoot(): return false

func is_reload(): return false

func is_arm(): return false
