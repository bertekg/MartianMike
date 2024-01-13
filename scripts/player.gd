extends CharacterBody2D

@onready var animationSprite = $AnimatedSprite2D

func _process(delta):
	if Input.is_action_just_pressed("move_right"):
		animationSprite.play("run")
