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

	if event.is_action_released("ui_select") and self.action.is_valid():
		print("calling function")
		self.action.call_func(self.context)

