tool
extends Node2D

export var radius = 30.0
export var color = Color(1.0, 0, 0)

func _draw():
	var center = Vector2(0, 0)
	draw_circle(center, radius, color)
