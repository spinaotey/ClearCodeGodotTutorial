extends Area2D

@export var speed: float = 500
var direction: Vector2 = Vector2.UP

func _process(delta):
    position += direction * speed * delta

func set_direction(dir: Vector2):
    self.direction = dir
    rotation = dir.angle()