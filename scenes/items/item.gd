extends Area2D

var rotation_speed: float = 3
var direction: Vector2 = Vector2.ZERO
var distance: float = randf_range(150,250)
var type: Enums.ITEM_TYPE = (randi() % Enums.ITEM_TYPE.size()) as Enums.ITEM_TYPE

func _ready():
	match type:
		Enums.ITEM_TYPE.LASER:
			$Sprite2D.modulate = Color.DARK_CYAN
		Enums.ITEM_TYPE.GRENADE:
			$Sprite2D.modulate = Color.DARK_RED
		Enums.ITEM_TYPE.HEALTH:
			$Sprite2D.modulate = Color.DARK_SEA_GREEN
	
	#tween spawn
	var tween = create_tween()
	tween.set_parallel(true)
	var target_position = global_position + direction * distance
	tween.tween_property(self, "global_position", target_position, 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, .7).from(Vector2.ZERO)

func _process(delta):
	rotate(rotation_speed * delta)


func _on_body_entered(body):
	if "get_item" in body:
		body.get_item(type)
		queue_free()
