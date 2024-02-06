extends Node2D
class_name Level

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)
	for scout in get_tree().get_nodes_in_group("Scout"):
		scout.connect("laser_emission", _on_scout_laser)

func _on_container_opened(pos: Vector2, direction: Vector2):
	var item = item_scene.instantiate()
	item.global_position = pos
	item.direction = direction
	$Items.call_deferred("add_child",item)
	

func _on_player_laser(pos: Vector2, direction: Vector2):
	create_laser(pos, direction)


func _on_player_grenade(pos:Vector2, direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	$Projectiles.add_child(grenade)
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed


func _on_scout_laser(pos: Vector2, dir: Vector2):
	create_laser(pos, dir)

func create_laser(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate()
	$Projectiles.add_child(laser)
	laser.position = pos
	laser.set_direction(direction)