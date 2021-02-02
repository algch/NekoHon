extends Control
var book_request_class = preload("res://Interface/BookRequest.tscn")

func add_book(order):
	var book_request = book_request_class.instance()
	book_request.init(order)
	$RequestContainer.add_child(book_request)
