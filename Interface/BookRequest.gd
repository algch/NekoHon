extends Control


var time := 0.0

func init(order):
	self.time = order.wait_time

func _ready():
	$Tween.interpolate_property($VBoxContainer/ProgressBar, "value", 100, 0, self.time)
	$Tween.start()

func _on_Timer_timeout():
	self.queue_free()
