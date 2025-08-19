extends BuiltinTools
class_name Cat

func run(params : Array):
	if params.is_empty():
		return "select a file"
	var target_file = params[0]
	var path = Global.current_direrctory.path_join(target_file)
	
	var file = FileAccess.open(path,FileAccess.READ)
	var file_content = file.get_as_text()
	print_debug(file_content)
	return set_output_data(file_content)


	
