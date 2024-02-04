extends Area2D

@export var speed: float = 500
var direction: Vector2 = Vector2.UP

func _ready():
	$SelfDestructTimer.start()

func _process(delta):
	position += direction * speed * delta

func set_direction(dir: Vector2):
	self.direction = dir
	rotation = dir.angle()

func _on_body_entered(body:Node2D):
	if "hit" in body:
		body.hit()
	queue_free()

func _on_timer_timeout():
	queue_free()
