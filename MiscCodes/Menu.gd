extends Node2D

func _ready():
	pass # Replace with function body.

func _on_Btn_PlayGame_pressed():
	Global.LoadSave()
	Global.GoToScene("res://Other/base_tilemap/base_tilemap.tscn") #Hier kan eventueel de mapnaam van de database ingevoerd worden!
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

