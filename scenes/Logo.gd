extends Sprite2D

var pos: Vector2 = Vector2.ZERO
const speed: int = 400 
var temp_scale: float = 2

func _ready():
    pos = Vector2(300, 200)
    position = pos
    
    # var test_rotation = 45
    # rotation_degrees = test_rotation
    scale = Vector2.ONE * temp_scale

func _process(delta):
    pos.x += speed * delta
    position = pos
    # temp_scale += 0.05
    # scale = Vector2.ONE * temp_scale