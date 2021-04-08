extends Node2D

var ShowInventory = 0
var LeftClick = 0
var player_inventory_items = []
var river_intersection_home_2 = preload("res://river_intersection_home2.tscn").instance()
var inventory_screen = preload("res://MiscScenes/Inventory.tscn").instance()
var current_scene = null
var current_camera = null
var dev_stats = true

func AddInventoryItem(itemid, amount):
	for x in range(40):
		if(player_inventory_items[x].item_id == itemid):
			print(str(player_inventory_items[x]))
			player_inventory_items[x].amount += amount
			return
	#if we reached here then no exisiting item is found and we iterate the array again
	print("adding item")
	for x in range(40):
		if(player_inventory_items[x].item_id == 0):
			player_inventory_items[x].id = x
			player_inventory_items[x].item_name = "name"
			player_inventory_items[x].shortdesc = "desc"
			player_inventory_items[x].item_id = itemid
			player_inventory_items[x].amount = amount
			return

func GoToScene(scene):
	if current_scene != null:
		get_tree().get_root().remove_child(current_scene)
	match scene:
		"river_intersection_home_2":
			current_scene = river_intersection_home_2
			get_tree().get_root().add_child(river_intersection_home_2)
		"inventory_screen":
			inventory_screen = preload("res://MiscScenes/Inventory.tscn").instance()
			current_scene = inventory_screen
			get_tree().get_root().add_child(inventory_screen)

func LoadSave():
	Database.OpenConnection()

#Save everything
func Save():
	Database.SaveInventory(player_inventory_items)
	print(player_inventory_items)

func _input(event):
	pass

func _ready():
	get_tree().get_root().add_child(river_intersection_home_2)
	get_tree().get_root().add_child(inventory_screen)
	pass

func Log(msg, level=1):
	match level:
		1:
			print("[Log]" + msg)
		2:
			print("[Warn]" + msg)
		3:
			print("[Err]" + msg)
