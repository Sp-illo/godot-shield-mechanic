extends ColorRect

# variable to remember if we are dragging
var is_dragging = false

# function that triggers ONLY when the mouse does something OVER the bar
func _gui_input(event):
	# left mouse button click...
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		# ...and the button is pressed down, we turn the switch on
		if event.pressed:
			is_dragging = true

# this function runs continuously
func _process(delta):
	# checking if we are holding down the left mouse button
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		# if the button is pressed AND we are dragging...
		if is_dragging:
			# move the bar exactly where the mouse is
			# the "- (size / 2)" centers the bar on the tip of the cursor
			global_position = get_global_mouse_position() - (size / 2)
	else:
		# if the player releases the mouse button, turn off the switch
		is_dragging = false
