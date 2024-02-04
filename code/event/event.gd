class_name Event

var list : Array[Callable]

func call_event():
	for c in list:
		c.call()

func add(c : Callable):
	list.append(c)

func remove(c : Callable):
	list.erase(c)
