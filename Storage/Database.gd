extends Node
const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var path = "user://storage.db"
var db_name = "RingOfRaces"
var db = null
var verbose = true

var host = null

# Called when the node enters the scene tree for the first time.
func _ready():
	host = OS.get_name()

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
	if(str(OS.get_name()) == "X11"):
		path = "res://storage.db"
	self.db = SQLite.new()
	var file = File.new()
	self.db.path = path
	self.db.verbose_mode = verbose
	var create = false
	print(path)
	
	# This does not seem to work. The file is in the right place, but being recreated everytime. The file is findable in Res:// and C:/ .. But not after the user folder
	if !file.file_exists(path):
		print("File not existing, so creating new db")
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
	
func SaveInventory(player_inventory_items):
	print("Now on inventory save file")
	if(player_inventory_items == null or len(player_inventory_items) != 40):
		Global.Log("Bad inventory save!", 3)
		return
	OpenConnectionIfClosed()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
