extends Station


func _ready():
	self.path_identifier = "tinta"
	self.expected_previous_paths = [
		[],
		["papel"],
		["papel", "cortar"],
	]

func execute_action(character):
	if character.current_component and self.is_path_valid(character.current_component):
		character.replace_component(Component.instance().init(character.current_component, self.path_identifier, "c.png"))
