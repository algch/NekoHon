extends Node

class_name Order

signal order_created

var recipe = null

var min_time = 30
var max_time = 60
var score = 0

var wait_time = 0.0
var related_book = null


func init(_recipe):
	self.recipe = _recipe

	return self

func fulfilled_by(component):
	for path in self.recipe.expected_paths:
		if component.path == path:
			return true

	return false

func fulfill():
	if self.related_book:
		related_book.queue_free()

	queue_free()

func _ready():
	self.wait_time = randi() % (max_time - min_time + 1) + min_time
	self.score = int(self.wait_time / 10)

	emit_signal("order_created", self)
