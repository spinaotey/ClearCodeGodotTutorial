extends RigidBody2D

const speed: float = 700

func explosion():
    $AnimationPlayer.play("Explosion")