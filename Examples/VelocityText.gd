extends Label

func _process(delta):
	self.text = str("Velocity ", "\n", self.get_parent().linear_velocity.length())
