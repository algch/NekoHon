extends Node2D

var book_request_class = preload("res://Interface/BookRequest.tscn")

func _on_OrderTimer_timeout():
	var order = Order.new()
	$Orders.add_child(order)
	$HUD.add_book(order)


func _on_TypewriterStation_action_executed(context):
	print("typewriter actioned with ", context)
