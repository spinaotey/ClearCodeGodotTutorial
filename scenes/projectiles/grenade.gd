extends RigidBody2D

const speed: float = 700
@export var can_hit: bool = false
var bodies: Array = []

func explosion():
	$AnimationPlayer.play("Explosion")


func _process(_delta):
	if can_hit:
		for body in bodies:
			if "hit" in body:
				body.hit()
		can_hit = false
		$Explosion/ExplosionColission/ExplosionRate.start()


func _on_explosion_colission_body_exited(body:Node2D):
	if body in bodies:
		bodies.erase(body)


func _on_explosion_colission_body_entered(body:Node2D):
	if body not in bodies:
		bodies.append(body)


func _on_explosion_rate_timeout():
	can_hit = true
