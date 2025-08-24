extends BuiltinTools
class_name Rm

func run(params : Array):
	if params.is_empty():
		return Messages.parameter_message
		
	var entry = params[0]
	var path = HelperFunctions.convert_to_path(entry)
	var dir = DirAccess.open(Global.current_direrctory)
	dir.remove(path)
	return set_output_data("entry is removed")
