extends Node2D

@export var nextLevel: PackedScene = null
@export var isFinalLevel: bool = false
@export var levelTime = 5

@onready var start = $Start
@onready var exit = $Exit
@onready var deathZone = $Deathzone
@onready var hud = $UILayer/HUD
@onready var uiLayer = $UILayer

var player = null
var timerNode = null
var timeLeft

var win = false

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		resetPlayer()
	var traps = get_tree().get_nodes_in_group("traps")	
	for trap in traps:
		trap.touchedPlayer.connect(_on_trap_touched_player)
	exit.body_entered.connect(_on_exit_body_entered)
	deathZone.body_entered.connect(_on_deathzone_body_entered)
	timeLeft = levelTime
	hud.set_time_label(timeLeft)
	timerNode = Timer.new()
	timerNode.name = "Level Timer"
	timerNode.wait_time = 1
	timerNode.timeout.connect(_on_level_timer_timeout)
	add_child(timerNode)
	timerNode.start()

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_deathzone_body_entered(_body):
	AudioPlayer.play_sfx("hurt")
	resetPlayer()

func _on_trap_touched_player():
	AudioPlayer.play_sfx("hurt")
	resetPlayer()

func resetPlayer():
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_pos()

func _on_exit_body_entered(body):
	if body is Player:
		if isFinalLevel == true or nextLevel != null:
			exit.animate()
			player.active = false
			win = true
			await get_tree().create_timer(1).timeout
			if isFinalLevel == true:
				uiLayer.show_win_screen(true)
			else :
				get_tree().change_scene_to_packed(nextLevel)

func _on_level_timer_timeout():
	if win == false:
		timeLeft -= 1
		if timeLeft < 0:
			resetPlayer()
			timeLeft = levelTime
		hud.set_time_label(timeLeft)
