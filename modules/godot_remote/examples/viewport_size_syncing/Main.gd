extends Control

var is_vertical = false
var screen_aspect = get_window().size.x / get_window().size.y

func _ready():
	# Waiting for one frame until the device is created
	await get_tree().idle_frame
	# Connect to server signals
	GodotRemote.get_output_device().connect("client_viewport_orientation_changed",Callable(self,"_screen_rotated"))
	GodotRemote.get_output_device().connect("client_viewport_aspect_ratio_changed",Callable(self,"_screen_aspect_changed"))

# Simple functions to resize window
func _screen_rotated(_is_vertical):
	is_vertical = _is_vertical
	if _is_vertical:
		get_window().size = Vector2(600, 600 / screen_aspect)
	else:
		get_window().size = Vector2(600 * screen_aspect, 600)

func _screen_aspect_changed(_aspect):
	screen_aspect = _aspect
	_screen_rotated(is_vertical)
