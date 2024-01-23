extends Area2D

@export var speed: float = 500

func _process(delta):
    move_local_y(-speed * delta)