class_name FuncLookInput

var look_direction_func

func _init(_look_direction_func : Callable):
	look_direction_func = _look_direction_func

func look_direction():
	return look_direction_func.call()
