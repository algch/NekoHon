extends Character


func _unhandled_input(event):
	if event.is_action_pressed("ui_up"):
		y_axis -= 1
	if event.is_action_released("ui_up"):
		y_axis += 1

	if event.is_action_pressed("ui_down"):
		y_axis += 1
	if event.is_action_released("ui_down"):
		y_axis -= 1

	if event.is_action_pressed("ui_left"):
		x_axis -= 1
	if event.is_action_released("ui_left"):
		x_axis += 1

	if event.is_action_pressed("ui_right"):
		x_axis += 1
	if event.is_action_released("ui_right"):
		x_axis -= 1

	if event.is_action_pressed("ui_select") and self.execute_action.is_valid():
		print("executing action")
		self.execute_action.call_func(self)

	if event.is_action_released("ui_select") and self.cancel_action.is_valid():
		print("cancelling action")
		self.cancel_action.call_func(self)
