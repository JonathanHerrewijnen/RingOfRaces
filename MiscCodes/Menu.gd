extends Node2D

func _ready():
	pass # Replace with function body.

func _on_Btn_PlayGame_pressed():
	Global.LoadSave()
	Global.GoToScene("res://Other/base_tilemap/base_tilemap.tscn") #Hier kan eventueel de mapnaam van de database ingevoerd worden!

func _on_Btn_LoadGame_pressed():
	Global.GoToScene("loadgame_screen")

