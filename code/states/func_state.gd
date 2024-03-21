class_name FuncState

var start_func
var update_func
var exit_func
var next_func

func _init(_start_func, _update_func, _exit_func, _next_func):
	start_func = _start_func
	update_func = _update_func
	exit_func = _exit_func
	next_func = _next_func

func update(_delta):
	update_func.call(_delta)

func exit():
	exit_func.call()

func next():
	return next_func.call()
