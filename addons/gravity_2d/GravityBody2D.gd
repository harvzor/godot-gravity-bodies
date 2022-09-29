extends RigidBody2D

#var gravity = 6.6743 * pow(10,-11) # realistic gravity
var gravity = 6.6743 * pow(10, 1)
#export var mass = 0.0
var velocity = Vector2.ZERO
var group = "gravity_2d_bodies"

func _ready():
	self.add_to_group(group)
	
func find_all_bodies(node: Node):
	var bodies = []
	if node == null:
		node = get_tree().current_scene
	
	for sub_node in node.get_children():
		if sub_node.is_in_group(group):
			bodies.append(sub_node)
		else:
			bodies.append_array(find_all_bodies(sub_node))
			
	return bodies
	

func gravity_from_all_bodies():
	var acceleration = Vector2.ZERO
	var bodies = find_all_bodies(null)
	for body in bodies:
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
