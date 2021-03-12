extends Node

class_name Order

signal order_created

var components = []

var min_time = 30
var max_time = 60

var wait_time = 0.0

class Component:
	var id = ""
	var image_path = ""

	func _init(_id, _image_path):
		self.id = _id
		self.image_path = "res://Interface/Sprites/Components/" + _image_path

func init(_components):
	self.components = _components

func _ready():
	self.wait_time = randi() % (max_time - min_time + 1) + min_time

	emit_signal("order_created", self)
