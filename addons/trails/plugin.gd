tool
extends EditorPlugin

var custom_type = "Trail2D"

func _enter_tree():
	add_custom_type(custom_type, "Line2D", preload("2DTrail.gd"), preload("trails2d.png"))
func _exit_tree():
	remove_custom_type(custom_type)
