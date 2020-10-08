extends Node2D

func _ready():
	pass # Replace with function body.

func _on_Btn_PlayGame_pressed():
	Global.LoadSave()
	Global.GoToScene("river_intersection_home_2")

