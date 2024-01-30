extends Level


func _on_exit_gate_body_entered(_body:Node2D):
    var tween = create_tween()
    tween.tween_property($Player, "speed", 0, 0.5)
