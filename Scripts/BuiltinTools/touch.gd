extends BuiltinTools
class_name Touch


func run(params : Array):
	
	if params.is_empty():
		return set_output_data(Messages.parameter_message)
		
	var content : String
	var _name = params[0]
	
	if params.size() > 1 :
		content = params[1]
		
	var file_access = FileAccess.open(Global.current_direrctory.path_join(_name),FileAccess.WRITE)
	if content:
		file_access.store_string(content)
		return set_output_data(Messages.process_succedded)
