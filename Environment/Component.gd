extends Sprite

class_name Component

var path = []

class Recipe:
	var expected_paths = []
	var name = ""
	var image = null

	func _init(_name, _paths, _image_name):
		self.name = _name
		self.expected_paths = _paths
		var texture = load("res://Interface/Sprites/Components/" + _image_name)
		if texture:
			self.image = texture


func init(previous_component = Component.new(), path_identifier = "", image_name = null):
	if previous_component:
		self.path = previous_component.path

	self.path.append(path_identifier)

	if image_name:
		var image = load("res://Interface/Sprites/Components/" + image_name)
		if image:
			self.texture = image

	return self
