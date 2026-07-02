extends Area2D

# The speed of the bullet in pixels per second
const SPEED = 250.0

# This function runs 60 times a second
func _process(delta):
	# Move the bullet to the left continuously
	# multiply by "delta" to keep the movement smooth regardless of frame rate
	global_position.x -= SPEED * delta
