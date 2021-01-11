extends Area2D

var characters = {}
signal action_executed


func execute_action(context):
	emit_signal("action_executed", context)

func _on_ActionListener_body_entered(body):
	if body is Character:
		characters[body.get_instance_id()] = body
		body.action = funcref(self, "execute_action")

func _on_ActionListener_body_exited(body):
	if body is Character and body.get_instance_id() in characters:
		characters.erase(body.get_instance_id())
		body.action = FuncRef.new()
