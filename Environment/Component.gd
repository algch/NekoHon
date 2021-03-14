extends Sprite

class_name Component

var path = []

func init(previous_component = Component.instance(), path_identifier = "", image_name=null):
	if previous_component:
		self.path = previous_component.path

	self.path.append(path_identifier)

	if image_name:
		var image = load("res://Interface/Sprites/Components/" + image_name)
		if image:
			self.texture = image

	return self

func _ready():
	pass
