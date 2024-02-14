class_name UpdateEvent

var list : Array[Callable]

func call_event(_delta : float):
	for c in list:
		c.call(_delta)

func add(c : Callable):
	list.append(c)

func remove(c : Callable):
	list.erase(c)
