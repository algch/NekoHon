extends Node2D

var book_request_class = preload("res://Interface/BookRequest.tscn")

func _unhandled_input(event):
	if event.is_action_released("ui_select"):
		self._on_book_requested()

func _on_book_requested():
	var book = book_request_class.instance()
	$HUD.add_book(book)

