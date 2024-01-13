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
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jumpForce
	
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	move_and_slide()

# Boolean Operatiors
# NOT -> !, not
# AND -> &&, and
# OR -> ||, or

func _ready():
	var a = not false
	print(a)	
	var b = false
	var resultAnd = a and b
	print(resultAnd)
	var resultOr = a or b
	print(resultOr)
