extends Node

signal health_change

var laser_amount: int = 20
var grenade_amount: int = 5
var health: float = 60:
    get:
        return health
    set(value):
        health = clamp(value, 0, 100)
        health_change.emit()