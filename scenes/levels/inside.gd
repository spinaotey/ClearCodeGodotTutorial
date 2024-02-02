extends Level


func _on_exit_gate_body_entered(_body:Node2D):
	var tween = create_tween()
	tween.tween_property($Player,"speed",0, .5)
	TransitionLayer.change_scene("res://scenes/levels/outside.tscn")
