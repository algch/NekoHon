extends Area2D


var characters = {}

class_name Station

# Extensible function
func execute_action(_context):
	pass

func _on_Station_body_entered(body):
	if body is Character:
		characters[body.get_instance_id()] = body
		body.action = funcref(self, "execute_action")

func _on_Station_body_exited(body):
	if body is Character and body.get_instance_id() in characters:
		characters.erase(body.get_instance_id())
		body.action = FuncRef.new()
