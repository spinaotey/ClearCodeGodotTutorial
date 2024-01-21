extends Node2D

var speed: float = 500

func _process(delta):

    # input movement
    var direction = Input.get_vector("left", "right", "up", "down")
    position += direction * speed * delta

    # laser shoot
    if Input.is_action_pressed("primary action"):
        print("Shoot laser!")

    # shoot grenade
    if Input.is_action_pressed("secondary action"):
        print("Shoot grenade!")