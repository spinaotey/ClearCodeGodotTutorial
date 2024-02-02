extends Level

func _on_gate_player_entered_gate(_body:Node2D):
	var tween = create_tween()
	tween.tween_property($Player,"speed",0, .5)
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/inside.tscn")

func _on_house_player_entered():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2.ONE, 1.0)
	tween.tween_property($Player, "modulate:a", 0.1, 2)


func _on_house_player_exited():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2.ONE * 0.6, 1.0)
	tween.tween_property($Player, "modulate:a", 1, 2)
