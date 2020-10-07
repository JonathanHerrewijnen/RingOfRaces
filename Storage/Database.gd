extends Node
const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var path = "res://Storage/World1.db"
var db_name = "RingOfRaces" 
var db = null
var verbose = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func OpenConnection():
	self.db = SQLite.new()
	self.db.path = path
	self.db.verbose_mode = verbose
	self.db.open_db()

func OpenConnectionIfClosed():
	if self.db == null:
		OpenConnection()
		
func GetInventoryItems():
	OpenConnectionIfClosed()
	var ret = []
	for x in range(40):
		ret.append([x, "test"])
	return ret
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
