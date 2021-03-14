extends Control

var order
var wait_time := 0.0
var timer = Timer.new()

func init(_order):
	self.order = _order
	self.wait_time = _order.wait_time

	return self

func _ready():
	self.timer.set_wait_time(self.wait_time)
	self.timer.set_autostart(true)
	self.timer.connect("timeout", self, "_on_timer_timeout")
	self.add_child(timer)
	for component in self.order.components:
		var image = TextureRect.new()
		image.texture = component.texture
		$VBoxContainer/HBoxContainer.add_child(image)

	$Tween.interpolate_property($VBoxContainer/ProgressBar, "value", 100, 0, self.wait_time)
	$Tween.start()

func _on_timer_timeout():
	self.queue_free()
	self.order.queue_free()
