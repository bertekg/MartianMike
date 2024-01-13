extends CharacterBody2D

@export var gravity = 400
@export var speed = 125
@export var jumpForce = 200
@export var maxFallVelocity = 500

@onready var animationSprite = $AnimatedSprite2D

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
		if velocity.y > maxFallVelocity:
			velocity.y = maxFallVelocity
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jumpForce
	
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	move_and_slide()
