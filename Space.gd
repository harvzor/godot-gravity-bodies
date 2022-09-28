extends Spatial

var gravity = 6.6743 * pow(10,-11)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Planet.velocity = Vector2(0, 0.125)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
