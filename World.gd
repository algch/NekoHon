extends Node2D

var book_request_class = preload("res://Interface/BookRequest.tscn")
var available_books = [
	{
		"components": [Order.Component.new("A", "a.png"), Order.Component.new("B", "b.png")],
	},
	{
		"components": [Order.Component.new("C", "c.png")],
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
