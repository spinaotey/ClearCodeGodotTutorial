extends Area2D

var rotation_speed: float = 3


var type: Enums.ITEM_TYPE = (randi() % Enums.ITEM_TYPE.size()) as Enums.ITEM_TYPE

func _ready():
	match type:
		Enums.ITEM_TYPE.LASER:
			$Sprite2D.modulate = Color.DARK_CYAN
		Enums.ITEM_TYPE.GRENADE:
			$Sprite2D.modulate = Color.DARK_RED
		Enums.ITEM_TYPE.HEALTH:
			$Sprite2D.modulate = Color.DARK_SEA_GREEN

func _process(delta):
	rotate(rotation_speed * delta)


func _on_body_entered(body):
	if "get_item" in body:
		body.get_item(type)
		queue_free()
