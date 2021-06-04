extends KinematicBody2D

const GRAVITY = 0.0
const WALK_SPEED = 200
const interaction_circle_size = 150
onready var background_map  = get_node("/root/base_scene/background")
onready var player = get_node("/root/base_scene/Player")
onready var cell_size = background_map._get_cell_size()
onready var plants_map = get_node("/root/base_scene/interaction_map")
onready var interaction = get_node("/root/base_scene/player_interaction")
onready var sound = get_node("../AudioStreamPlayer")

var velocity = Vector2()
var world_position
var ItemClass = preload("res://MiscScenes/Item.tscn")
var previous_position = Vector2(0,0)

#Moving buttons
func _physics_process(delta):
	var cur = Vector2(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y))
	if(cur != previous_position):
		interaction.set_cell(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y) , 0)
		interaction.set_cell(previous_position.x, previous_position.y, -1)
		previous_position = Vector2(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y))
	if Input.is_key_pressed(KEY_SPACE) or Input.is_mouse_button_pressed(BUTTON_LEFT):
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
	var plant_cell_mouse = plants_map.get_cell(int(world_position[0] / cell_size.x), int(world_position[1] / cell_size.y))
	var plant_cell_character = plants_map.get_cell(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y))
	
	var background_cell = background_map.get_cell(int(world_position[0] / cell_size.x), int(world_position[1] / cell_size.y))
	var interaction_cell = interaction.get_cell(int(world_position[0] / cell_size.x), int(world_position[1] / cell_size.y))
	
	if plant_cell_mouse > 0 and plant_cell_mouse % 2 == 0:
		Global.AddInventoryItem(plant_cell_mouse/2, 1)
		plants_map.set_cell(int(world_position[0] / cell_size.x), int(world_position[1] / cell_size.y), (plant_cell_mouse-1)) 
		AnimationOnInteraction(1)
		SoundOnInteraction()
		Global.Save()
	elif plant_cell_character > 0 and plant_cell_character % 2 == 0:
		Global.AddInventoryItem(plant_cell_character/2, 1)
		plants_map.set_cell(int(self.position.x / cell_size.x), int(self.position.y / cell_size.y), (plant_cell_character-1)) 
		AnimationOnInteraction(1)
		SoundOnInteraction()
	else:
		#space is now a test function
		GlobalGameFunctions.RenderSpeech(self, "joe")
		pass
	
func _interaction_process():
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		world_position = get_global_mouse_position()
		InteractWithCell()
	elif Input.is_key_pressed(KEY_SPACE):
		world_position = get_global_mouse_position()
		InteractWithCell()

func _input(event):
	pass

func AnimationOnInteraction(Item):
	print("Item = ", Item, " Animation")
	var itemimage = TextureRect.new()	
	var item = null

func SoundOnInteraction():
	var CorrectSound = preload("res://Sounds/standard.wav")
	$AudioStreamPlayer.stream = CorrectSound
	$AudioStreamPlayer.play()
		
	pass

func _ready():
	Global.player_inventory_items = Database.GetInventoryItems().duplicate()
