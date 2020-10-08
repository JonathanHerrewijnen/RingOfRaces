extends Node2D

var id = 0
# Many thanks to Arkeve! https://github.com/arkeve

func _ready():
	match Global.player_inventory_items[self.id].item_id:
		0:
			pass
		1:
			$TextureRect.texture = load("res://pictures/inventory_iconpictures/miscellaneous/magic_formulae.png")
		2:
			$TextureRect.texture = load("res://pictures/inventory_iconpictures/tools_and_weapons/tools/ploeg.png")
