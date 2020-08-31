extends TouchScreenButton

onready var ShowInventory = get_node("res://Global.gd")

func _input(always):
	ShowInventory = 1;
