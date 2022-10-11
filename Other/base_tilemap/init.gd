extends Node2D

func load_scene(map_data):
	var scene = load(map_data+".tscn")
	print("MAP NAME ",map_data+".tscn")
	var map = scene.instance()
	return map
	
			
func _ready():
	self.add_child(load_scene("res://Maps/river_intersection"))
