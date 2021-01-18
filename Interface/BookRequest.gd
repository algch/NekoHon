extends Control

var min_time = 10
var max_time = 20


func _ready():
	var time = randi() % (max_time - min_time + 1) + min_time
	print("time ", time)
	$Timer.set_wait_time(time)
	$Timer.start()
	$Tween.interpolate_property($VBoxContainer/ProgressBar, "value", 100, 0, $Timer.get_wait_time())
	$Tween.start()

func _on_Timer_timeout():
	self.queue_free()
