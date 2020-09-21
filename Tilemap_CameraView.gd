extends Camera2D


onready var player = get_node("/root/Map1/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var once = true
var lockedPlayerCamera = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	CameraToPlayer()
	if once:
		AnimateMoveCamera(player.position, Vector2(player.position.x - 10,player.position.y - 10), "position", 2)
		once = false
	pass

#Move camera to position
func MoveCamera(x, y):
	position.x = x
	position.y = y

func _on_Tween_tween_completed(object, key):
	print(object, key)
	lockedPlayerCamera = false	

func AnimateMoveCamera(source, destination, key, time):
	lockedPlayerCamera = true
	var tween = get_node("/root/Map1/Tween")
	tween.interpolate_property(get_node("/root/Map1/Camera2D"), key, source, destination, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	

#Move camera close to player
func CameraToPlayer():
	if lockedPlayerCamera == false:
		MoveCamera(player.position.x, player.position.y)
