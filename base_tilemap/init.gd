extends Node2D

func load_scene(map_data):
	$background.tile_set = load("base_tilemap/tilesets/background_ts.tres")
	$vegetation.tile_set = load("res://river_intersection_home2.tscn::1")

	for x in range(map_data.width):
		for y in range(map_data.height):
			$background.set_cell(x, y, map_data.background_map[x][y])
			$vegetation.set_cell(x, y, -1)
			$interaction_map.set_cell(x, y, -1)
			$player_interaction.set_cell(x, y, -1)
			
func _ready():
	pass # Replace with function body.
