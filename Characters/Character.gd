extends KinematicBody2D


signal component_grabbed(stuff)

class_name Character


var y_axis = 0
var x_axis = 0
var SPEED = 500
var execute_action = FuncRef.new()
var cancel_action = FuncRef.new()

# component holded by the character
var current_component = Component.new()

func replace_component(component):
	self.current_component = component

	for child in $ComponentContainer.get_children():
		$ComponentContainer.remove_child(child)
	$ComponentContainer.add_child(component)

	print("Took " + str(component.path))

func _physics_process(delta):
	var direction = Vector2(x_axis, y_axis).normalized()
	var motion = direction * SPEED

	move_and_slide(motion)
