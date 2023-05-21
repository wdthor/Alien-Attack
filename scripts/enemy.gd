extends Area2D

@export var speed = 200

func _physics_process(delta):
	global_position.x -= speed * delta

func die():
	queue_free()

func _on_body_entered(body):
#	The player takes damage
	body.take_damage()
#	The enemy dies
	die()
