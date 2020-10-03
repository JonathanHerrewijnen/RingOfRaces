<<<<<<< HEAD
extends TouchScreenButton

#func _input(always):
func _physics_process(delta):
	if Input.is_action_pressed("move_left") and Input.is_action_pressed("move_right"):
		show()
	elif Input.is_action_pressed("ui_end"):
		hide();
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
=======
>>>>>>> 9841ce41a7dbf89828d925e42afe78aa918fe9de
