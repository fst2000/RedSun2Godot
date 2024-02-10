class_name Stopwatch

var start_time

func _init():
	start_time = Time.get_ticks_msec() * 0.001

func get_time() -> float:
	return (Time.get_ticks_msec() * 0.001) - start_time
