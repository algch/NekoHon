extends Station



var timer = Timer.new()
var wait_time = 5

var character_ref = null


func _ready():
	timer.set_one_shot(true)
	timer.set_wait_time(wait_time)
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(self.timer)

	self.expected_previous_paths = [["paper"]]

func _on_timer_timeout():
	if character_ref:
		print("timer timed out")
		character_ref.replace_component(Component.instance().init(character_ref.current_component, "escribir", "b.png"))

func execute_action(character):
	if not character.current_component:
		print("NO STUFF")
		return

	if character.current_component and self.is_path_valid(character.current_component):
		self.character_ref = character
		$Tween.interpolate_property($ProgressBar, "value", 0, 100, wait_time)
		$Tween.start()
		timer.start()
		print("timer started")

func cancel_action(_character):
	print("timer canceled")
	$Tween.stop_all()
	self.timer.stop()
	self.character_ref = null
	$ProgressBar.value = 0
