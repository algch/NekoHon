extends KinematicBody2D

class_name Character

var y_axis = 0
var x_axis = 0
var SPEED = 300
var action = FuncRef.new()

var context = {}

func _physics_process(delta):
    var direction = Vector2(x_axis, y_axis).normalized()
    var motion = direction * SPEED

    move_and_slide(motion)
