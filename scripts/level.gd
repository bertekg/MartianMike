extends Node2D

@onready var start = $Start
var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		resetPlayer()
	var traps = get_tree().get_nodes_in_group("traps")	
	for trap in traps:
		trap.touchedPlayer.connect(_on_trap_touched_player)

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
	player.global_position = start.get_spawn_pos()
