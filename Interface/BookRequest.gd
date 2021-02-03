extends Control


var wait_time := 0.0
var timer = Timer.new()

func init(order):
	self.wait_time = order.wait_time

func _ready():
	self.timer.set_wait_time(self.wait_time)
	self.timer.set_autostart(true)
	self.timer.connect("timeout", self, "_on_timer_timeout")
	self.add_child(timer)

	$Tween.interpolate_property($VBoxContainer/ProgressBar, "value", 100, 0, self.wait_time)
	$Tween.start()

func _on_timer_timeout():
	self.queue_free()
