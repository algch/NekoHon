extends Node

const Component = preload("res://Environment/Component.tscn")

var available_books = [
	{
		"components": [Component.instance().init(null, "papel", "a.png")],
	},
	{
		"components": [Component.instance().init(null, "tinta", "b.png")],
	},
	{
		"components": [Component.instance().init(null, "acuarelas", "c.png")],
	},
	{
		"components": [Component.instance().init(null, "hilo", "a.png")],
	},
	{
		"components": [Component.instance().init(null, "pasta_de_bambu", "b.png")],
	},
]

func _on_OrderTimer_timeout():
	var order = Order.new()
	var components = available_books[randi() % len(available_books)]["components"]
	order.init(components)
	$Orders.add_child(order)
	$HUD.add_book(order)

func _on_TypewriterStation_action_executed(context):
	print("typewriter actioned with ", context)

func _on_ControllableCharacter_component_grabbed(stuff):
	$HUD/HBoxContainer/CurrentStuff.set_text(stuff.name)
