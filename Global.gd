extends Node2D

var ShowInventory = 0
var LeftClick = 0
var player_inventory_items = []
var river_intersection_home_2 = preload("res://river_intersection_home2.tscn").instance()
var inventory_screen = preload("res://MiscScenes/Inventory.tscn").instance()
var current_scene = null
#func _add_a_scene_manually():
#    # This is like autoloading the scene, only
#    # it happens after already loading the main scene.
#    get_tree().get_root().add_child(simultaneous_scene)

func GoToScene(scene):
	if current_scene != null:
		get_tree().get_root().remove_child(current_scene)
	match scene:
		"river_intersection_home_2":
			current_scene = river_intersection_home_2
			get_tree().get_root().add_child(river_intersection_home_2)
			 #.change_scene_to(river_intersection_home_2)
		"inventory_screen":
			current_scene = inventory_screen
			get_tree().get_root().add_child(inventory_screen)


func LoadSave():
	Database.OpenConnection()

func _input(event):
	pass

func _ready():
	get_tree().get_root().add_child(river_intersection_home_2)
	get_tree().get_root().add_child(inventory_screen)
	pass
