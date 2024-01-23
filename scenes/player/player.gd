extends CharacterBody2D

var speed: float = 500
var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):

    # input movement
    var direction = Input.get_vector("left", "right", "up", "down")
    velocity = direction * speed
    move_and_slide()

    # laser shoot
    if Input.is_action_pressed("primary action") and can_laser:
        print("Shoot laser!")
        can_laser = false
        $LaserTimer.start()

    # shoot grenade
    if Input.is_action_pressed("secondary action") and can_grenade:
        print("Shoot grenade!")
        can_grenade = false
        $GrenadeTimer.start()

func _on_laser_timer_timeout():
    can_laser = true

func _on_grenade_timer_timeout():
    can_grenade = true