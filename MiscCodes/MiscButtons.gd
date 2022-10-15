extends TouchScreenButton

func _physics_process(delta):
	if Input.is_action_pressed("move_left") and Input.is_action_pressed("move_right"):
		show()
	elif Input.is_action_pressed("ui_end"):
		hide()
