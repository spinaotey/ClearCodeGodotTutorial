extends CharacterBody2D

signal laser(pos: Vector2, direction: Vector2)
signal grenade(pos: Vector2, direction: Vector2)

@export var max_speed: int = 700
var speed: int = max_speed
var can_laser: bool = true
var can_grenade: bool = true
var _laser_start_positions: Array[Node]

func _ready():
	_laser_start_positions = $LaserStartPositions.get_children()

func _process(_delta):

	# input movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	# rotate
	look_at(get_global_mouse_position())

	# laser shoot
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		var laser_postion = _laser_start_positions.pick_random().global_position
		var laser_direction = global_position.direction_to(get_global_mouse_position()).normalized()
		var particles: GPUParticles2D = $ShootParticles
		if particles.emitting:
			particles.restart()
		particles.emitting = true
		laser.emit(laser_postion,laser_direction)
		can_laser = false
		$LaserTimer.start()

	# shoot grenade
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		var grenade_postion = _laser_start_positions.pick_random().global_position
		var grenade_direction = global_position.direction_to(get_global_mouse_position()).normalized()
		grenade.emit(grenade_postion, grenade_direction)
		can_grenade = false
		$GrenadeTimer.start()
		

func _on_laser_timer_timeout():
	can_laser = true

func _on_grenade_timer_timeout():
	can_grenade = true
