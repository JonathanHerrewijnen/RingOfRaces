extends Node

#const SQLiteOriginal = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns") 
#const SQLite = preload("user://gdsqlite.gdns")

var path = "user://Storage/World1.db"
var db_name = "RingOfRaces" 
var db = null
var verbose = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func CreateWorldDatabase():
	print("Creating new database")
	var SQLite = load("user://gdsqlite.gdns")
	var player_inventory : Dictionary = Dictionary()
	player_inventory["id"] = {"data_type":"int", "primary_key": true, "not_null": true} #slot id
	player_inventory["item_id"] = {"data_type":"int", "not_null": true} #item id
	player_inventory["item_name"] = {"data_type":"text", "not_null": true} #item name
	player_inventory["amount"] = {"data_type":"int", "not_null": true} #amount
	player_inventory["shortdesc"] = {"data_type":"char(80)", "not_null": true} #short description
	db.create_table("player_inventory", player_inventory)
	var items : Dictionary = Dictionary()
	for i in range(40):
		items["id"] = i
		items["item_id"] = 0
		items["item_name"] = "No Item"
		items["amount"] = 0
		items["shortdesc"] = "No item here"

		# Insert a new row in the table
		db.insert_row("player_inventory", items)
		items.clear()

func OpenConnection():
	var SQLite = load("user://gdsqlite.gdns")
	self.db = SQLite.new()
	var file = File.new()
	self.db.path = path
	self.db.verbose_mode = verbose
	var create = false
	if !file.file_exists(path):
		create = true
	self.db.open_db()
	if create:
		CreateWorldDatabase()

func OpenConnectionIfClosed():
	if self.db == null:
		OpenConnection()
		
func GetInventoryItems():
	OpenConnectionIfClosed()
	var ret = []
	ret = db.select_rows("player_inventory", "",["*"])
	return ret
	
func SaveInventory(inventory):
	if(inventory == null or len(inventory) != 40):
		Global.Log("Bad inventory save!", 3)
		return
	OpenConnectionIfClosed()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
