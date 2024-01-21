extends Node2D


func _ready():
    $Logo.rotation_degrees = 90

func _process(delta):

    if $Logo.position.x >= 1000:
        $Logo.pos.x = 0
    
    $Logo.rotation_degrees += 120 * delta

    if $Logo.rotation_degrees >= 180:
        $Logo.rotation_degrees = 0
    
    Input.is_action_pressed("left")