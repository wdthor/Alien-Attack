extends CharacterBody2D

var speed = 500

func _physics_process(delta):
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("mouve_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	move_and_slide()
	
#	=== 1st method ===
#	if global_position.x < 0:
#		global_position.x = 0
#	if global_position.x > 1280:
#		global_position.x = 1280
#	if global_position.y < 0:
#		global_position.y = 0
#	if global_position.y > 720:
#		global_position.y = 720

#	global_position gets the player current x, y positions
#   get_viewport_rect().size gets the viewport (window) size

#	=== 2nd method ===
	var screen_size = get_viewport_rect().size
#	global_position.x = clampf(global_position.x, 0, screen_size.x)
#	global_position.y = clampf(global_position.y, 0, screen_size.y)

#	=== 3rd method ===		
	global_position = global_position.clamp(Vector2(0, 0), screen_size)
	
	
