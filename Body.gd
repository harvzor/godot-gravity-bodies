extends MeshInstance

var gravity = 6.6743 * pow(10,-11)
export var mass = 0.0
var velocity = Vector3.ZERO
export var sun = false

func _ready():
	if sun:
		$OmniLight.light_energy = 10

func _process(delta):
	velocity += acceleration()
	translation += velocity

func acceleration():
	var acceleration = Vector3.ZERO
	for body in get_parent().get_children():
		if body.is_in_group("physics"):
			if body != self:
				var acc = gravity(body.mass, body.translation)/mass
				acceleration += acc
	return acceleration

func gravity(m, position):
	var distance = translation.distance_squared_to(position)
	var force = gravity * (mass * m / distance)
	var vector = (position - translation).normalized()
	force *= vector
	return force
