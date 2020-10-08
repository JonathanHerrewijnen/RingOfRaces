extends Panel

#Many thanks to Arkeve! https://github.com/arkeve

#var default_tex = preload("res://item_slot_default_background.png")
#var empty_tex = preload("res://item_slot_empty_background.png")

var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null

var ItemClass = preload("res://MiscScenes/Item.tscn")
var item = null
var id = 0
#onready var id = int(self.name[4:0])

func _ready():
	if self.name.length() == 5:
		self.id = int(self.name.right(1)) - 1
	else:
		self.id = int(self.name.right(2)) - 1
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	#default_style.texture = default_tex
	#empty_style.texture = empty_tex
#	print(self.get)
	if Global.player_inventory_items[self.id] != null:
		item = ItemClass.instance()
		item.set("id", self.id)
		add_child(item)
#	refresh_style()
		
#func refresh_style():
#	if item == null:
#		set('custom_styles/panel', empty_style)
#	else:
#		set('custom_styles/panel', default_style)
		
func pickFromSlot():
	remove_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
#	refresh_style()
	
func putIntoSlot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)
	add_child(item)
#	refresh_style()
