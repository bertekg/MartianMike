extends Area2D

@onready var animationSprite = $AnimatedSprite2D
@export var jumpForce = 300

func _on_body_entered(body):
	if body is Player:
		animationSprite.play("jump")
		body.jump(jumpForce)
