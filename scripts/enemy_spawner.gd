extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")

@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
#	Will call spawn_enemy() every x times set in the Wait Time from the right panel
	spawn_enemy()

func spawn_enemy():
	var spawn_position_list = spawn_positions.get_children()
	var random_spawn_position = spawn_position_list.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.global_position
	add_child(enemy_instance)
	
