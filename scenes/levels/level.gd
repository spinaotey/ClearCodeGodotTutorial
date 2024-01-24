extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body:Node2D):
	
	print("Player entered gate!")
	print(body)


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
