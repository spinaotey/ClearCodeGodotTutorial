extends StaticBody2D

class_name ItemContainer

@export var n_items: int = 3
var opened: bool = false

signal open(pos: Vector2, direction: Vector2)

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

func hit () -> void:
    if opened:
        return
    opened = true
    $LidSprite.hide()
    var positions: Array[Node] = $SpawnPositions.get_children()
    for i in range(n_items):
        open.emit(positions[randi() % positions.size()].global_position, current_direction)
