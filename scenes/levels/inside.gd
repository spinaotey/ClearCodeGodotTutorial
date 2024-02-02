extends Level


func _on_exit_gate_body_entered(_body:Node2D):
	var tween = create_tween()
	tween.tween_property($Player,"speed",0, .5)
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/outside.tscn")
