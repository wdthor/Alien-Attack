extends CharacterBody2D

var speed = 500

var rocket_scene = preload("res://scenes/rocket.tscn")

# @onready is a shortcut for _ready() function
# $RocketContainer is a shortcut for get_node("RocketContainer")
# Sets a reference to the RocketContainer node
@onready var rocket_container = $RocketContainer

#var rocket_container
#func _ready():
#	rocket_container = get_node("RocketContainer")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

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
	
	var screen_size = get_viewport_rect().size

	global_position = global_position.clamp(Vector2(0, 0), screen_size)

func shoot():
#	Instantiate a rocket at the Player's position
	var rocket_instance = rocket_scene.instantiate()
#	add_child(rocket_instance)
#	instantiate a rocket at the RocketContainer's position
	rocket_container.add_child(rocket_instance)
#	set the rocket position to the Player position
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80
