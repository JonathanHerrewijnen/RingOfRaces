extends KinematicBody2D

const GRAVITY = 0.0
const WALK_SPEED = 200
const interaction_circle_size = 150
onready var background_map  = get_node("/root/Map1/background")
onready var player = get_node("/root/Map1/Player")
onready var cell_size = background_map._get_cell_size()

var velocity = Vector2()

#Moving buttons
func _physics_process(delta):
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x =  WALK_SPEED
	elif Input.is_action_pressed("move_up"):
		velocity.y =  -WALK_SPEED
	elif Input.is_action_pressed("move_down"):
		velocity.y =  WALK_SPEED
#	elif Input.is_action_pressed("map_interaction"):
#		print("Interacted")
#		print(InputEventMouseButton.position)		
	else:
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide(velocity, Vector2(0, -1))

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		var pos = event.position
		if Input.is_action_pressed("map_interaction"):
			pass
			
#   elif event is InputEventMouseMotion:
#	   print("Mouse Motion at: ", event.position)
#
#   # Print the size of the viewport.
#   print("Viewport Resolution is: ", get_viewport_rect().size)
