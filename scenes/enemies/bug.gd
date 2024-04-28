extends CharacterBody2D

@export var walk_speed: int = 300
@export var rotation_speed: float = 3
var player_nearby: bool = false
var in_attack_range: bool = false
var health: int = 10


func _process(delta):
	if player_nearby:
		Utils.rotate_towards(self, Globals.player_position, rotation_speed * delta)
		velocity = Vector2.RIGHT.rotated(rotation) * walk_speed
		move_and_slide()
	
		if in_attack_range:
			$AnimatedSprite2D.play("attack")
		else:
			$AnimatedSprite2D.play("walk")
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")


func hit():
	health -= 3
	if health <= 0:
		queue_free()
	else:
		shader()

func shader():
	$AnimatedSprite2D.material.set_shader_parameter("progress", .2)
	await get_tree().create_timer(.5).timeout
	$AnimatedSprite2D.material.set_shader_parameter("progress", 0)

func _on_attack_area_body_exited(_body:Node2D):
	in_attack_range = false


func _on_attack_area_body_entered(_body:Node2D):
	in_attack_range = true


func _on_notice_area_body_exited(_body:Node2D):
	player_nearby = false


func _on_notice_area_body_entered(_body:Node2D):
	player_nearby = true
