extends Node2D

# Many thanks to Arkeve! https://github.com/arkeve

func _ready():
	if randi() % 3 == 0:
		$TextureRect.texture = load("res://pictures/inventory_iconpictures/miscellaneous/magic_formulae.png")
	else:
		$TextureRect.texture = load("res://pictures/inventory_iconpictures/tools_and_weapons/tools/ploeg.png")
