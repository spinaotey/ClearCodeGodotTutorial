extends Node

signal laser_amount_change
signal grenade_amount_change
signal health_change

var player_position: Vector2


var laser_amount: int = 20:
    get:
        return laser_amount
    set(value):
        laser_amount = value
        laser_amount_change.emit()
var grenade_amount: int = 5:
    get:
        return grenade_amount
    set(value):
        grenade_amount = value
        grenade_amount_change.emit()
var health: float = 60:
    get:
        return health
    set(value):
        health = clamp(value, 0, 100)
        health_change.emit()