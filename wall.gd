extends RigidBody2D

func _physics_process(delta):
	var collision = move_and_collide(Vector2.ZERO)  # Use Vector2.ZERO to get collision info
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("Wall"):
			$WallHitParticle.emitting = true
