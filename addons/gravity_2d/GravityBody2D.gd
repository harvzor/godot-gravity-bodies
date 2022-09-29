extends RigidBody2D

#var gravity = 6.6743 * pow(10,-11)
var gravity = 6.6743 * pow(10, 1)
#export var mass = 0.0
var velocity = Vector2.ZERO
var group = "gravity_2d_bodies"

func _ready():
	self.add_to_group(group)

func gravity_from_all_bodies():
	var acceleration = Vector2.ZERO
	for body in get_parent().get_children():
		if body.is_in_group(group):
			if body != self:
				var acc = gravity_for_single_body(body)/mass
				acceleration += acc
	return acceleration

func gravity_for_single_body(body):
	var distance = position.distance_squared_to(body.position)
	var force = gravity * (mass * body.mass / distance)
	var vector = (body.position - position).normalized()
	force *= vector
	return force

func _integrate_forces(state):
	self.apply_impulse(Vector2.ZERO, gravity_from_all_bodies())
