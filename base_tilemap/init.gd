extends Node2D

func load_scene(map_data):
	var imageset = load("res://omgeving/Floor.tres")
	$background.tile_set = imageset
	for x in range(map_data.width):
		for y in range(map_data.height):
			$background.set_cell(x, y, map_data.background_map[x][y])
			$vegetation.set_cell(x, y, map_data.background_map[x][y])
			$interaction_map.set_cell(x, y, map_data.background_map[x][y])
			$player_interaction.set_cell(x, y, 0)
	if(1==1):
		pass

func _ready():
	pass # Replace with function body.
