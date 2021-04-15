extends Node
const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var path = "res://Savegames/"
var db_name = "RingOfRaces"
var db = null
var verbose = true

var host = null

# Called when the node enters the scene tree for the first time.
func _ready():
	host = OS.get_name()

class Inventory_structure:
	var id = 0
	var item_id = 0
	var item_name = "item_name"
	var amount = 0
	var shortdesc = "shortdesc"
	
	func _init(id, item_id, item_name, amount, shortdesc):
		self.id = id
		self.item_id = item_id
		self.item_name = item_name
		self.amount = amount
		self.shortdesc = shortdesc

func CreateWorldDatabase():
	print("Creating new database")
	#Inventory
	var player_inventory : Dictionary = Dictionary()
	player_inventory["id"] = {"data_type":"int", "primary_key": true, "not_null": true} #slot id
	player_inventory["item_id"] = {"data_type":"int", "not_null": true} #item id
	player_inventory["item_name"] = {"data_type":"text", "not_null": true} #item name
	player_inventory["amount"] = {"data_type":"int", "not_null": true} #amount
	player_inventory["shortdesc"] = {"data_type":"char(80)", "not_null": true} #short description
	self.db.create_table("player_inventory", player_inventory)
	var items : Dictionary = Dictionary()
	for i in range(40):
		items["id"] = i
		items["item_id"] = 0
		items["item_name"] = "No Item"
		items["amount"] = 0
		items["shortdesc"] = "No item here"

		# Insert a new row in the table
		self.db.insert_row("player_inventory", items)
		items.clear()

	#Other world data

func OpenConnection():
	if(str(OS.get_name()) == "Android"):
		path = "user://Savegames/"
	path += Global.dbname
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

func CloseConnection():
	if self.db != null:
		self.db.commit()
		self.db.close()
		self.db = null
		
func GetInventoryItems():
	OpenConnectionIfClosed()
	return db.select_rows("player_inventory", "",["*"])
	
func SaveInventory(player_inventory_items):
	print("Now on inventory save file")
	if(player_inventory_items == null or len(player_inventory_items) != 40):
		Global.Log("Bad inventory save!", 3)
	OpenConnectionIfClosed()
	var items : Dictionary = Dictionary()
	for item in player_inventory_items:
		if(item['item_id'] == 0):
			continue
		items["id"] = item["id"]
		items["item_id"] = item["item_id"]
		items["item_name"] = item["item_name"]
		items["amount"] = item["amount"]
		items["shortdesc"] = item["shortdesc"]
		#self.db.query("select * from player_inventory")
		self.db.update_rows("player_inventory", "id == " + str(items['id']),items)
		#items.clear()
	Global.Log("Inventory save succeeded", 1)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
