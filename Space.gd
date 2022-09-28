extends Spatial

var gravity = 6.6743 * pow(10,-11)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Body2.velocity = Vector3(0, 0, 0.002583)
	print(sqrt(gravity * get_node("Body").mass / 20))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
