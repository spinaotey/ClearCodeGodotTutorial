extends CharacterBody2D

var speed: float = 200

func _process(_delta):
    velocity.x = speed
    move_and_slide()