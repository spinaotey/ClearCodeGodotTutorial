extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(_body:Node2D):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)


func _on_player_laser(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate()
	$Projectiles.add_child(laser)
	laser.position = pos
	laser.set_direction(direction)


func _on_player_grenade(pos:Vector2, direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	$Projectiles.add_child(grenade)
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed


func _on_house_player_entered():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2.ONE, 1.0)
	tween.tween_property($Player, "modulate:a", 0.1, 2)


func _on_house_player_exited():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2.ONE * 0.6, 1.0)
	tween.tween_property($Player, "modulate:a", 1, 2)
