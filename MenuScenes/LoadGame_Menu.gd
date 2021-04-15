extends Node2D

var savegames = []
var savegamepath = "res://Savegames"

func getsave_games(path):
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif file.ends_with(".db"):
			savegames.append(file)
	dir.list_dir_end()

func load_and_play(name):
	Global.LoadSave(name)
	Global.GoToScene("river_intersection_home_2")

func _ready():
	if(OS.get_name() == "Android"):
		savegamepath = "user://Savegames"
	getsave_games(savegamepath)
	for item in savegames:
		var button1 = Button.new()
		button1.text = item
		button1.connect("pressed", self, "load_and_play", ["item"])
		button1.show()
		get_node("ScrollContainer/VBoxContainer").add_child(button1)
		
