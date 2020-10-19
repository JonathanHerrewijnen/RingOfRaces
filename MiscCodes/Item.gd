extends Node2D

var id = 0
# Many thanks to Arkeve! https://github.com/arkeve

func _ready():
	match Global.player_inventory_items[self.id].item_id:
		0:
			pass
		
		# Id 0-40 - Map foraging - 'Random' spawning
		1:
			$TextureRect.texture = load("res://pictures/inventory_iconpictures/miscellaneous/magic_formulae.png")
		2:
			$TextureRect.texture = load("res://pictures/inventory_iconpictures/tools_and_weapons/tools/ploeg.png")
		3:
			$TextureRect.texture = load("res://pictures/inventory_iconpictures/food_items/herbs/saffron.png")
			
		# Id 41-80 - Tools - Every tool map interaction NOT weapons
		41:
			$TextureRect.texture = load("res://pictures/inventory_iconpictures/tools_and_weapons/tools/ploeg.png")
		
		# Id 81-160 - Armour/Clothing
		
		# Id 161-240 - Farming and planting 

	if Global.player_inventory_items[self.id].amount > 0:
		var amountlbl = Label.new()
		amountlbl.set_position(Vector2(self.position.x+105, self.position.y+105))
		amountlbl.text = str(Global.player_inventory_items[self.id].amount)
		add_child(amountlbl)
