extends Area2D

signal player_entered
signal player_exited

func _on_body_exited(_body:Node2D):
    player_exited.emit()

func _on_body_entered(_body:Node2D):
    player_entered.emit()
