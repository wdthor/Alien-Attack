extends Area2D

@export var speed = 5

func _physics_process(delta):
	global_position.x += speed
