extends CharacterBody2D

# Movement speed and jump power
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# get the default gravity from the project settings
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# _physics_process is like _process, but specific for solid physics objects
func _physics_process(delta):
	# GRAVITY: If the player is not touching the floor, apply gravity to pull them down
	if not is_on_floor():
		velocity.y += gravity * delta

	# JUMP: If the player presses Spacebar ("ui_accept") and is on the floor, jump up
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# MOVEMENT: Get input from Left/Right arrows (or A/D keys)
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		# If pressing a key, move in that direction
		velocity.x = direction * SPEED
	else:
		# If not pressing anything, stop smoothly
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# EXECUTE: calculates all collisions and moves the player
	move_and_slide()
