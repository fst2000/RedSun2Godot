class_name Equipment

var primary
var secondary

func add_primary(weapon):
	if primary:
		primary.drop()
	primary = weapon

func add_secondary(weapon):
	if secondary:
		secondary.drop()
	secondary = weapon
