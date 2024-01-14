extends CharacterBody2D

@export var gravity = 400
@export var speed = 125
@export var jumpForce = 250
@export var maxFallVelocity = 500

@onready var animationSprite = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > maxFallVelocity:
			velocity.y = maxFallVelocity
	
	if Input.is_action_just_pressed("jump"):# and is_on_floor():
		velocity.y = -jumpForce
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		animationSprite.flip_h = direction == -1
		
	velocity.x = direction * speed
	move_and_slide()
	update_animation(direction)

func update_animation(direction):
	if is_on_floor():
		if  direction == 0:
			animationSprite.play("idle")
		else :
			animationSprite.play("run")
	else:
		if velocity.y > 0:
			animationSprite.play("fall")
		else :
			animationSprite.play("jump")
