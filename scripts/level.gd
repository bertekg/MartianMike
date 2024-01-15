extends Node2D

@onready var startPosition = $StartPosition
@onready var player = $Player

func _ready():
	#var array = [1, 2, 3, "hello", 2.3, true]
	#array[0] = "first"
	#array.append("new append")
	#array.remove_at(1)
	#array.erase("hello")
	#print(array)
	#print(array[1])
	#print(array[-2])
	#print("Size of array: " + str(array.size()))
	var traps = get_tree().get_nodes_in_group("traps")
	print(traps.size())

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_deathzone_body_entered(_body):
	resetPlayer()

func _on_trap_touched_player():
	resetPlayer()

func resetPlayer():
	player.velocity = Vector2.ZERO
	player.global_position = startPosition.global_position
