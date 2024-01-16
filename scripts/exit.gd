extends Area2D

@onready var animatedSprite = $AnimatedSprite2D

func _ready():
	#animate()
	pass

func animate():
	animatedSprite.play("default")
