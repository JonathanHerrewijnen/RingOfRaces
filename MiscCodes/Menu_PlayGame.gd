extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Button_gui_input(event):
	print(event)
	if event == InputEventScreenTouch.CONNECT_ONE_SHOT:
		get_tree().change_scene_to_file("res://river_intersection_home2.tscn")
	
	#	get_tree().change_scene_to_file("res://river_intersection_home2.tscn")
	pass # Replace with function body.
