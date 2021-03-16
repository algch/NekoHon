extends Area2D


class_name Station

const Component = preload("res://Environment/Component.tscn")

var characters = {}

# Extensible properties
var path_identifier := ""
var expected_previous_paths := [
	[],
]

# Extensible function
func execute_action(_character):
	pass

# Extensible function
func cancel_action(_character):
	pass

func _ready():
	self.connect("body_entered", self, "_on_Station_body_entered")
	self.connect("body_exited", self, "_on_Station_body_exited")

func is_path_valid(component):
	print(str(self.expected_previous_paths))
	print(component.path)
	for path in self.expected_previous_paths:
		if path == component.path:
			return true

	return false

func _on_Station_body_entered(body):
	if body is Character:
		characters[body.get_instance_id()] = body
		body.execute_action = funcref(self, "execute_action")
		body.cancel_action = funcref(self, "cancel_action")

func _on_Station_body_exited(body):
	if body is Character and body.get_instance_id() in characters:
		characters.erase(body.get_instance_id())
		body.execute_action = FuncRef.new()
		body.cancel_action = FuncRef.new()
		self.cancel_action(body)
