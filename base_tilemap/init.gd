extends Node2D

func load_scene(map_data):
#	var imageset = load("res://omgeving/Floor.tres")
	$background.tile_set = load("base_tilemap/tilesets/background_ts.tres")
	$background.tile_set.autotile_set_size(1, $background.tile_set.autotile_get_size(0))
	$background.tile_set.autotile_set_size(2, $background.tile_set.autotile_get_size(0))
	$background.tile_set.autotile_set_size(3, $background.tile_set.autotile_get_size(0))
	var k = $background
	$vegetation.tile_set = load("res://river_intersection_home2.tscn::1")
#	$vegetation.tile_set = preload("res://omgeving/Floor.tres")
	for x in range(map_data.width):
		for y in range(map_data.height):
			$background.set_cell(x, y, map_data.background_map[x][y])
			$vegetation.set_cell(x, y, 0)
			$interaction_map.set_cell(x, y, -1)
			$player_interaction.set_cell(x, y, -1)
			
func _ready():
	pass # Replace with function body.
