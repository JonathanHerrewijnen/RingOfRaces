extends Node2D

class base_tilemap:
	var width = 150
	var height = 150
	var background_ts = null
	var background_map = []
	var interaction_ts = null
	var interaction_map = []
	var player_ts = null
	var player_map = []
	var vegetation_ts = null
	var vegetation_map = []
	
	func init_map(width, height, background_ts_path, background_map, interaction_ts_path, interaction_map, player_ts_path, player_map, vegetation_ts_path, vegetation_map):
		self.width = width
		self.height = height
		self.background_ts = background_ts_path
		self.background_map = background_map
		self.interaction_ts = interaction_ts_path
		self.interaction_map = interaction_map
		self.player_ts = player_ts_path
		self.player_map = player_map
		self.vegetation_ts = vegetation_ts_path
		self.vegetation_map = vegetation_map
		
func t():
	print("woo")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
