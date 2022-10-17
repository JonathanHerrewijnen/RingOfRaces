extends Node2D
			
func _init():
	var map_name = "res://Maps/river_intersection.tscn"
	Global.AddMap(map_name)
#	for _i in self.get_children():
#		print("Nodes visible ",_i)
#		if _i is TileMap:
#			print("Checking ", _i)
#			for x in 300:
#				for y in 300:
#					if _i.get_cell(x, y) != -1:
#						print(_i.get_cell(x, y))
