extends TileMap

@onready var player = get_node("/root/base_scene/Player")
@onready var camera = get_node("/root/base_scene/Camera2D")

func _get_cell_size() -> TileMap:
	return self.tile_size

func _unhandled_input(event):
	var pl_pos = player.position
	var pl_pos_tile = Vector3(pl_pos.x  / self.tile_size.x, pl_pos.y  / self.tile_size.y, 0)

func _on_Settings_pressed():
	Global.GoToScene("menu")
	
func _on_Inventory_released():
	Global.AddScene("res://MiscScenes/Inventory.tscn")
