extends Station


func _ready():
	self.path_identifier = "paper"
	self.expected_previous_paths = [[]]

func execute_action(character):
	print("current_component ", character.current_component)
	if character.current_component and self.is_path_valid(character.current_component):
		character.replace_component(Component.instance().init(character.current_component, self.path_identifier, "a.png"))
