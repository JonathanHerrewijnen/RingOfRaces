extends TileMap

onready var player = get_node("/root/base_scene/Player")

func _ready():
	print(self.tile_set.get_tiles_ids())
	pass # Replace with function body.

func _get_cell_size():
	return cell_size

func _unhandled_input(event):
	var pl_pos = player.position
	var pl_pos_tile = Vector2(pl_pos.x  / cell_size.x, pl_pos.y  / cell_size.y)
	var pl_tile = get_cellv(pl_pos_tile)
	if event == Input.action_press("map_interaction"):
		if(pl_tile != -1):
			set_cellv(pl_pos_tile, -1)

# for some obscure reason, this function only works on the background script, but not on the e.g. player script or Camera2D script. May have something to do with loading/scripts being active?
func _on_Inventory_pressed():
	var inventory_screen = preload("res://MiscScenes/Inventory.tscn").instance()
	Global.AddScene(inventory_screen, "inventory_screen", true)
