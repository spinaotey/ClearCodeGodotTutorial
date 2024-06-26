extends CharacterBody2D

signal laser_emission(pos: Vector2, dir: Vector2)

var player_nearby: bool = false
var can_laser: bool = true
@onready var laser_positions = $LaserSpawners.get_children()
var current_laser_index: int = 0
var health: int = 9
var vulnerable: bool = true

func _process(_delta):
    if player_nearby:
        look_at(Globals.player_position)
        if can_laser:
            var laser_postion = laser_positions[current_laser_index].global_position
            var laser_direction = Vector2.RIGHT.rotated(rotation)
            laser_emission.emit(laser_postion, laser_direction)
            can_laser = false
            current_laser_index = (current_laser_index + 1) % laser_positions.size()
            $Timers/LaserCooldown.start()


func _on_attack_area_body_entered(_body:Node2D):
    player_nearby = true

func _on_attack_area_body_exited(_body:Node2D):
    player_nearby = false


func _on_laser_cooldown_timeout():
    can_laser = true

func hit():
    if vulnerable:
        health -= 3
        vulnerable = false
        $Timers/HitTimer.start()
        $Sprite2D.material.set_shader_parameter("progress",1)
    if health <= 0:
        queue_free()

func shader():
    $Sprite2D.material.set_shader_parameter("progress", .2)
    await get_tree().create_timer(.5).timeout
    $Sprite2D.material.set_shader_parameter("progress", 0)


func _on_hit_timer_timeout():
    vulnerable = true
    $Sprite2D.material.set_shader_parameter("progress", 0)
