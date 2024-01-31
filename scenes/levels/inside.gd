extends Level


func _on_exit_gate_body_entered(_body:Node2D):
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/outside.tscn")
