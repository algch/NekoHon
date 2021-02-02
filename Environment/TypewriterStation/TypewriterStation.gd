extends Station


func execute_action(context):
	if not "book" in context:
		print("You must have a book, context: ", context)

