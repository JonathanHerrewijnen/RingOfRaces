extends Node2D

var ShowInventory = 0
var LeftClick = 0
var player_inventory_items = []
var river_intersection_home_2 = preload("res://river_intersection_home2.tscn").instance()
var inventory_screen = preload("res://MiscScenes/Inventory.tscn").instance()
var current_scene = null

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
			 #.change_scene_to(river_intersection_home_2)
		"inventory_screen":
			inventory_screen = preload("res://MiscScenes/Inventory.tscn").instance()
			current_scene = inventory_screen
			get_tree().get_root().add_child(inventory_screen)

func LoadSave():
	Database.OpenConnection()

func _input(event):
	pass

func _ready():
	CheckDBInUserDir()
	get_tree().get_root().add_child(river_intersection_home_2)
	get_tree().get_root().add_child(inventory_screen)
	pass
	
func CheckDBInUserDir():
	var file2Check = File.new()
	if file2Check.file_exists("user://gdsqlite.gdns"):
		print("File exist! Doing nothing")
		return
	else:
		var dir = Directory.new();
		dir.copy("res://addons/godot-sqlite/bin/gdsqlite.gdns","user://gdsqlite.gdns")
		dir.make_dir("user://Storage/")
		print("Database not found, making one!")
	pass
