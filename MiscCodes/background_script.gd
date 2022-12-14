extends TileMap

onready var player = get_node("/root/base_scene/Player")
onready var camera = get_node("/root/base_scene/Camera2D")

func _get_cell_size():
	return cell_size

func _unhandled_input(event):
	var pl_pos = player.position
	var pl_pos_tile = Vector2(pl_pos.x  / cell_size.x, pl_pos.y  / cell_size.y)
	var pl_tile = get_cellv(pl_pos_tile)
#	if event == Input.action_press("map_interaction"):
#		if(pl_tile != -1):
#			set_cellv(pl_pos_tile, -1)

func _on_Settings_pressed():
	Global.GoToScene("menu")
	
func _on_Inventory_released():
	Global.AddScene("res://MiscScenes/Inventory.tscn")
