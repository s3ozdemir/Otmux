extends BuiltinTools
class_name Mkdir

func run(params :Array):
	if params.is_empty():
		return set_output_data(Messages.parameter_message)
	
	var entry = params[0]
	var path = HelperFunctions.convert_to_path(entry)
	var dir = DirAccess.open(Global.current_direrctory)
	dir.make_dir(path)
	
	return set_output_data(Messages.process_succedded)
