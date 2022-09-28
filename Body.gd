extends RigidBody2D

#var gravity = 6.6743 * pow(10,-11)
var gravity = 6.6743 * pow(10, 1)
#export var mass = 0.0
var velocity = Vector2.ZERO
var group = "bodies"

func _ready():
	self.add_to_group(group)

func acceleration():
	var acceleration = Vector2.ZERO
	for body in get_parent().get_children():
		if body.is_in_group(group):
			if body != self:
				var acc = gravity(body.mass, body.position)/mass
				acceleration += acc
	return acceleration

func gravity(m, position2):
	var distance = position.distance_squared_to(position2)
	var force = gravity * (mass * m / distance)
	var vector = (position2 - position).normalized()
	force *= vector
	return force

func _integrate_forces(state):
	self.apply_impulse(Vector2.ZERO, acceleration())
