extends Camera2D


onready var player = get_node("/root/Map1/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	CameraToPlayer()
#	TestCamera()
	pass

#Move camera to position
func MoveCamera(x, y):
	position.x = x
	position.y = y


func TestCamera():
	var t = player.position
	t.x = 100
	t.y = 100
	MoveCamera(t.x, t.y)
#	var tween = get_node("/root/Map1/Tween")
#	tween.interpolate_property(get_node("/root/Map1/Camera2D"), "position", player.position, t, 200, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#	tween.start()

#Move camera close to player
func CameraToPlayer():
	MoveCamera(player.position.x, player.position.y)
