extends KinematicBody2D

const GRAVITY = 0.0
const WALK_SPEED = 200
const interaction_circle_size = 150
onready var background_map  = get_node("/root/base_scene/background")
onready var player = get_node("/root/base_scene/Player")
onready var cell_size = background_map._get_cell_size()
onready var interaction_map = get_node("/root/base_scene/interaction_map")
onready var player_interaction = get_node("/root/base_scene/player_interaction")

var velocity = Vector2()
var world_position
var ItemClass = preload("res://MiscScenes/Item.tscn")
var previous_position = Vector2(0,0)

#Moving buttons
func _physics_process(delta):
	var cur = Vector2(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y))
	if(cur != previous_position):
		player_interaction.set_cell(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y) , 0)
		player_interaction.set_cell(previous_position.x, previous_position.y, -1)
		previous_position = Vector2(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y))
	if Input.is_action_just_pressed("interact_with_cell"):
		_interaction_process()
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x =  WALK_SPEED
	elif Input.is_action_pressed("move_up"):
		velocity.y =  -WALK_SPEED
	elif Input.is_action_pressed("move_down"):
		velocity.y =  WALK_SPEED
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide(velocity, Vector2(0, -1))
	
	Global.current_camera.Update()

func InteractWithCell():
	var plant_cell_mouse = interaction_map.get_cell(int(world_position[0] / cell_size.x), int(world_position[0] / cell_size.y))
	var plant_cell_character = interaction_map.get_cell(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y))
	
	var background_cell = background_map.get_cell(int(world_position[0] / cell_size.x), int(world_position[1] / cell_size.y))
	var interaction_cell = player_interaction.get_cell(int(world_position[0] / cell_size.x), int(world_position[1] / cell_size.y))
	
	print("plant cell mouse line 1: ", interaction_map.get_cell(12, 36))
	print('plant_cell_mouse=',plant_cell_mouse,' | plant_cell_character=', plant_cell_character,' | background_cell=', background_cell,' | interaction_cell=',interaction_cell)
	
	if plant_cell_mouse > 0 and plant_cell_mouse % 2 == 0:
		Global.AddInventoryItem(plant_cell_mouse/2, 1)
		interaction_map.set_cell(int(world_position[0] / cell_size.x), int(world_position[1] / cell_size.y), (plant_cell_mouse-1)) 
		AnimationOnInteraction(1)
		Global.Save()
	elif plant_cell_character > 0 and plant_cell_character % 2 == 0:
		Global.AddInventoryItem(plant_cell_character/2, 1)
		interaction_map.set_cell(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y), (plant_cell_character-1)) 
		AnimationOnInteraction(1)
	else:
		#space is now a test function
		pass
	
func _interaction_process():
	world_position = get_global_mouse_position()
	InteractWithCell()

func AnimationOnInteraction(Item):
	print("Item = ", Item, " Animation")
	var itemimage = TextureRect.new()	
	var item = null

func SoundOnInteraction(x):
	var format_string = "res://Sounds/%s.wav"
	var actual_string = format_string % x
	var Sound = load(actual_string)
	$AudioStreamPlayer.stream = Sound
	$AudioStreamPlayer.play()

func _ready():
	Global.player_inventory_items = Database.GetInventoryItems().duplicate()
