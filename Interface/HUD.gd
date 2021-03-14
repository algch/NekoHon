extends Control
const BookRequest = preload("res://Interface/BookRequest.tscn")

func add_book(order):
	var book_request = BookRequest.instance().init(order)
	$RequestContainer.add_child(book_request)
