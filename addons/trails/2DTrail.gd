extends Line2D

export var max_points = 1000
var point

func _ready():
	set_as_toplevel(true)

func _physics_process(delta):
	if !get_parent().is_visible():
		return
	
	point = get_parent().global_position
	add_point(point)

	if points.size() > max_points:
		remove_point(0)
