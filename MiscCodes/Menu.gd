extends Node2D

func _ready():
	pass # Replace with function body.

func _on_Btn_PlayGame_pressed():
	Global.LoadSave()
	Global.GoToScene("res://Other/base_tilemap/base_tilemap.tscn") #Hier kan eventueel de mapnaam van de database ingevoerd worden!
	
	#create gamemap on the fly - Obsolete as of 23 08 2021
#	var game_data = GlobalStructures.base_tilemap.new()
#	var map_data = [[]]
#	for x in range(150):
#		map_data.append([])
#		for y in range(150):
#			map_data[x].append(int(rand_range(0, 3)))
#	game_data.init_map(150, 150, "res://omgeving/Floor.tres",map_data, "res://omgeving/Floor.tres", map_data, "res://omgeving/Floor.tres", map_data, "res://omgeving/Floor.tres", map_data)
#	var game = load("res://base_tilemap/base_tilemap.tscn").instance()
#	game.load_scene(game_data)
#
#
#	#save this scene to global scenes
#	Global.AddScene(self, "menu", false)
#
#	#set this scene as main
#	Global.mainscene = "startmap1"
#	Global.AddScene(game, "startmap1", true)
##	get_tree().get_root().add_child(game)

func _on_Btn_LoadGame_pressed():
	Global.GoToScene("loadgame_screen")

