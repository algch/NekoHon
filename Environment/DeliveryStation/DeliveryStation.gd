extends Station


signal component_delivered(character)

func execute_action(character):
	emit_signal("component_delivered", character)
