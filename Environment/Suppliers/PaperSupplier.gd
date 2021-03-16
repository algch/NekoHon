extends Station


func _ready():
	self.path_identifier = "papel"
	self.expected_previous_paths = [
		[],
		["pinceles"],
		["tinta"],
	]

func execute_action(character):
	if character.current_component and self.is_path_valid(character.current_component):
		character.replace_component(Component.instance().init(character.current_component, self.path_identifier, "a.png"))
