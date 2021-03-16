extends Node

# const Component = preload("res://Environment/Component.tscn")
var score = 0
var max_orders = 5

var available_recipes = [
	Component.Recipe.new(
		"panfleto",
		[
			["papel", "cortar", "tinta", "escribir"],
			["papel", "tinta", "cortar", "escribir"],
			["tinta", "papel", "cortar", "escribir"],
		],
		"a.png"
	),
	Component.Recipe.new(
		"poster",
		[
			["papel", "cortar", "pinceles", "ilustrar"],
			["papel", "pinceles", "cortar", "ilustrar"],
			["pinceles", "papel", "cortar", "ilustrar"],
		],
		"b.png"
	),
]

func _on_OrderTimer_timeout():
	if len($Orders.get_children()) >= max_orders:
		return

	var recipe = available_recipes[randi() % len(available_recipes)]
	var order = Order.new().init(recipe)
	$Orders.add_child(order)
	$HUD.add_book(order)

func _on_ControllableCharacter_component_grabbed(stuff):
	$HUD/HBoxContainer/CurrentStuff.set_text(stuff.name)

func _on_DeliveryStation_component_delivered(character):
	var component = character.current_component
	print(component)
	for order in $Orders.get_children():
		if order.fulfilled_by(component):
			score += order.score
			order.fulfill()
			character.replace_component(Component.new())
			break

func _ready():
	randomize()
