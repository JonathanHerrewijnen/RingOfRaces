extends Camera2D


onready var player = get_node("/root/base_scene/Player")
onready var background_map  =  get_node("/root/base_scene/background")
onready var screen_size = self.get_viewport_rect().size

func _ready():
	calculate_bounds()
	Global.current_camera = self
	$dev_statistics.visible = Global.dev_stats

var once = true
var lockedPlayerCamera = false
var min_x = 0
var min_y = 0
var max_x = 0
var max_y = 0
var max_x_pixel = 0
var max_y_pixel = 0

#function that calculates the borders/bounds of the map
func calculate_bounds():
	var used_cells = background_map.get_used_cells()
	for pos in used_cells:
		if pos.x < min_x:
			min_x = int(pos.x)
		elif pos.x > max_x:
			max_x = int(pos.x)
		if pos.y < min_y:
			min_y = int(pos.y)
		elif pos.y > max_y:
			max_y = int(pos.y)
	print(min_x,"-",max_x, " AND " ,min_y , "-" , max_y)
	max_x_pixel = (max_x * 32)
	max_y_pixel = (max_y * 32)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.dev_stats):
		$dev_statistics/fps_stats.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS))
	CameraToPlayer()
	if once:
		once = false
		#AnimateMoveCamera(player.position, Vector2(player.position.x - 100,player.position.y - 10), "position", 2)
	pass

func get_global_pos():
	return Vector2(position.x, position.y)

#Move camera to position
func MoveCamera(x, y):
	if x < int(screen_size.x / 2):
		pass
	else:
		position.x = x	
	if y < int(screen_size.y / 2):
		pass
	else:
		position.y = y

func _on_Tween_tween_completed(object, key):
	print(object, key)
	lockedPlayerCamera = false

func AnimateMoveCamera(source, destination, key, time):
	var tween = get_node("/root/Map1/Tween")
	lockedPlayerCamera = true
	tween.interpolate_property(get_node("/root/Map1/Camera2D"), key, source, destination, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func CameraToPlayer():
	if lockedPlayerCamera == false:
		MoveCamera(player.position.x, player.position.y)

func Update():
	CameraToPlayer()
