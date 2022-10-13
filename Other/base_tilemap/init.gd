extends Node2D
			
func _ready():
	var map_name = "res://Maps/river_intersection"
	self.add_child(Global.load_scene(map_name))
