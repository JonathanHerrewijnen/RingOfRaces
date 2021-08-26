extends Node2D

var ShowInventory = 0
var LeftClick = 0
var player_inventory_items = []
var loadedscenes = {"RiverIntersectionHome":"res://Maps/river_intersection_home.tscn"}
#var river_intersection_home_2 = preload("res://Maps/river_intersection_home.tscn").instance()
var inventory_screen = preload("res://MiscScenes/Inventory.tscn").instance()
var loadgame_screen = null
var current_scene = null
var current_camera = null
var dev_stats = true
var dbname = "storage.db"
var mainscene = ""

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

func AddScene(scene, savename, loadscene=true):
	loadedscenes[savename] = scene
	if(loadscene):
		GoToScene(savename)
	pass

#Go to schene by name
func GoToScene(scene):
	print("Scene is ",scene)
	get_tree().change_scene("res://Maps/river_intersection_home.tscn")
	
	# Voor het geval iemand dit toch nog belangrijk vindt.
#	if current_scene != null:
#		print("here")
#		get_tree().change_scene("res://Maps/river_intersection_home.tscn")
#		get_tree().get_root().remove_child(current_scene)
#		get_tree().get_root().add_child(loadedscenes[scene])
#	if scene in loadedscenes:
#		current_scene = loadedscenes[scene]
#		get_tree().get_root().add_child(loadedscenes[scene])
#		return
#	else:
#		print("Could not load scene " + scene)
#	match scene:
#		"river_intersection_home_2":
#			current_scene = "river_intersection_home_2"
#			get_tree().get_root().add_child(river_intersection_home_2)
#		"inventory_screen":
#			inventory_screen = preload("res://MiscScenes/Inventory.tscn").instance()
#			current_scene = inventory_screen
#			get_tree().get_root().add_child(inventory_screen)
#		"loadgame_screen":
#			loadgame_screen = preload("res://MenuScenes/LoadGame_Menu.tscn").instance()
#			current_scene = loadgame_screen
#			get_tree().get_root().add_child(loadgame_screen)

func LoadSave(target="Storage.db"):
	dbname = target
	Database.OpenConnection()

#Save everything
func Save():
	Database.SaveInventory(player_inventory_items)
	print(player_inventory_items)

func _input(event):
	pass

func _ready():
#	get_tree().get_root().add_child(river_intersection_home_2)
#	get_tree().get_root().add_child(inventory_screen)
	pass

func Log(msg, level=1):
	match level:
		1:
			print("[Log]" + msg)
		2:
			print("[Warn]" + msg)
		3:
			print("[Err]" + msg)
