extends Node

class_name Order

signal order_created

# Path of stations to become fulfilled
var station_path = []

var min_time = 10
var max_time = 20

var wait_time = 0.0

var timer = Timer.new()

func _ready():
	self.wait_time = randi() % (max_time - min_time + 1) + min_time
	self.timer.set_wait_time(self.wait_time)
	self.timer.set_autostart(true)
	self.add_child(timer)

	emit_signal("order_created", self)
