extends Node2D
class_name Level

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")


func _on_player_laser(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate()
	$Projectiles.add_child(laser)
	laser.position = pos
	laser.set_direction(direction)
	$UI.update_laser_text()


func _on_player_grenade(pos:Vector2, direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	$Projectiles.add_child(grenade)
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$UI.update_grenade_text()
