extends AnimatableBody2D

# Switch to remember if I am dragging the bar
var is_dragging = false
# Offset to keep the exact click position smooth without jumping
var drag_offset = Vector2.ZERO

# this function ONLY triggers when you click INSIDE the blue CollisionShape2D
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Turn on the dragging switch
			is_dragging = true
			# Calculate the exact distance between the object's position and the mouse
			drag_offset = global_position - get_global_mouse_position()

# this function runs 60 times per second to move the bar smoothly
func _process(delta):
	# Check if the player is holding down the left mouse button
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		# Move ONLY if the dragging switch is ON (meaning we clicked inside the bar)
		if is_dragging:
			global_position = get_global_mouse_position() + drag_offset
	else:
		# If the mouse button is released, turn off the dragging switch
		is_dragging = false
		
		# This function shrinks both the visual and the physical shield
func accorcia_barra():
	var damage_amount = 20.0
	
	# reduce the width (X axis) of the colored rectangle
	$barraVita.size.x -= damage_amount
	
	# reduce the width (X axis) of the invisible physical collision
	$CollisionShape2D.shape.size.x -= damage_amount
