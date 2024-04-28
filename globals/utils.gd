extends Node

## Rotates Node2D towards target position
func rotate_towards(node: Node2D, target_position: Vector2, delta_angle: float) -> void:
    # Calculate the direction to the target
    var direction_to_target = (target_position - node.global_position).normalized()
    
    # Calculate the angle between current direction and target direction
    var angle_to_target = direction_to_target.angle()

    if node.rotation != angle_to_target:
        # Check if the angle difference is less than the rotation for this frame
        if abs(angle_to_target - node.rotation) < delta_angle:
            # If the difference is small, set the rotation directly
            node.rotation = direction_to_target.angle()
        else:
            # Otherwise, rotate towards the target direction with minimum angle distance
            node.rotation += delta_angle * get_rotation_direction(node.rotation, angle_to_target)


func get_rotation_direction(current_angle: float, target_angle: float) -> int:
    var angular_distance = fmod((target_angle - current_angle + PI), (2 * PI)) - PI

    if abs(angular_distance) > PI:
        # Shortest path involves wrapping around the circle
        return sign(-angular_distance)
    else:
        # Shortest path doesn't wrap around the circle
        return sign(angular_distance)
