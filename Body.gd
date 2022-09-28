extends MeshInstance2D

var gravity = 6.6743 * pow(10,-11)
export var mass = 0.0
var velocity = Vector2.ZERO
export var sun = false

func _ready():
	if sun:
		$OmniLight.energy = 10

func _process(delta):
	velocity += acceleration()
	position += velocity

func acceleration():
	var acceleration = Vector2.ZERO
	for body in get_parent().get_children():
		if body.is_in_group("physics"):
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
