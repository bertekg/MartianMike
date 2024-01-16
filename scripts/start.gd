extends StaticBody2D

@onready var spawnPosition = $SpawnPosition

func get_spawn_pos():
	return spawnPosition.global_position 
